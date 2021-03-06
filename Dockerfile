FROM openjdk:11-jre-slim

USER root
RUN groupadd -g 550 appuser && useradd -r -m -u 1000 -g appuser appuser

ENV PYTHONUNBUFFERED=1

RUN apt-get update && apt-get --assume-yes install python3 \
&& apt-get --assume-yes install python3-pip

RUN ln -s -f python3 /usr/bin/python

RUN pip3 install --no-cache --upgrade \
pip \
setuptools \
awscli

#CVE https://security-tracker.debian.org/tracker/CVE-2022-23219
RUN apt-get --only-upgrade install libc-bin=2.31-13+deb11u3

RUN apt-get --assume-yes autoremove python3-pip && apt-get clean

USER appuser


