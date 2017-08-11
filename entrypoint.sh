#!/bin/sh

if [ -n "$ALPINE_PACKAGES" ]; then
  apk add --no-cache ${ALPINE_PACKAGES}
fi

# Generate Host keys, if required
if [ ! -f /etc/ssh/ssh_host_* ]; then
  ssh-keygen -A
fi

# Allow keys to be passed in via env
if [ -n "$AUTHORIZED_KEYS" ]; then
  IFS=$'\n'
  keys=$(echo ${AUTHORIZED_KEYS} | tr "," "\n")
  for key in $keys
  do
      key=$(echo $key | sed -e 's/^ *//' -e 's/ *$//')
      cat ~/.ssh/authorized_keys | grep "$key" >/dev/null 2>&1
      if [ $? -ne 0 ]; then
          echo "=> Adding public key to .ssh/authorized_keys: $key"
          echo "$key" >> ~/.ssh/authorized_keys
      fi
  done
fi

# Allow root login if password is provided
if [ -n "$PASSWORD" ]; then
  sed -i s/#PermitRootLogin.*/PermitRootLogin\ yes/ /etc/ssh/sshd_config && \
  echo "root:$PASSWORD" | chpasswd
fi

exec "$@"
