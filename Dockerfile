FROM ubuntu:16.04
MAINTAINER Lionel Nicolas <lionel.nicolas@nividic.org>

ADD build-image /tmp/build-image
RUN /tmp/build-image
