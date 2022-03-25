# docker-jdk11-test-runner

## Overview

The docker image produced by this repository provides a base image with java 11 and the aws cli.

## Build

Script provided for building locally 

```
./build.sh
```

# Security Notes

- The image installs an unprivileged user `appuser` and delegates control to this user at the end of the build process. When extending this image any command requiring privileged execution will require switching to the superuser taking care to return delegation back to the unprivileged user:

  ```docker
  FROM   FROM nexus.nonprod.ekagra-finch.com/repository/finch/jdk11-test-runner-base:latest

  USER root

  COPY ./test-repo-dir /test-repo-dir

  USER appuser
  ```