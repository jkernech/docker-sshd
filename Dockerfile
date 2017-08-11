FROM alpine

MAINTAINER Julien Kernec'h <docker@parallel.li>

RUN apk add --no-cache openssh

EXPOSE 22

COPY entrypoint.sh /usr/local/bin

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

CMD ["/usr/sbin/sshd", "-D"]
