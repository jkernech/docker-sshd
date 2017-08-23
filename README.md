
 ## Docker SSHD

[![CircleCI](https://img.shields.io/circleci/project/github/jkernech/docker-sshd.svg)](https://circleci.com/gh/jkernech/docker-sshd)

 SSH service wrapped in a container to connect to and inspect other container’s volumes, or to get quick access to a test container.

 This service is configurable via the following environment variables.

### Environment variables

##### `ALPINE_PACKAGES`
Install alpine packages during the build phase.

##### `AUTHORIZED_KEYS`
Install provided SSH keys on the container hosts.

##### `PASSWORD`
Grant `root` user credentials to log with provided `PASSWORD`

### Setup

*Docker environment needs to be setup on your machine.*

Run it locally:
```
docker run -p 2222:22 -e PASSWORD=qwerty123456 -it jkernech/sshd
```
