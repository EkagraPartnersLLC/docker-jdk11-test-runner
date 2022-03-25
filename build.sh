#!/bin/bash

IMAGE_NAME=${IMAGE_NAME:-"nexus.nonprod.ekagra-finch.com/repository/finch/jdk11-test-runner-base"}
IMAGE_TAG=${IMAGE_TAG:-"latest"}
# Example build line
docker build -t "${IMAGE_NAME}:${IMAGE_TAG}" .