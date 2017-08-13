# This file is a modified version of `https://github.com/swiftdocker/docker-swift/blob/ef9aa534705fc8ab4258c539f6304072ebae9613/Dockerfile`.
FROM ubuntu:16.04

LABEL maintainer="tomoya@mitsuse.jp"

USER root

RUN useradd -g users -G sudo -s /bin/bash -m developer

# Install related packages and set LLVM 3.6 as the compiler
RUN apt-get -q update && \
    apt-get -q install -y \
    make \
    libc6-dev \
    clang-3.6 \
    curl \
    libedit-dev \
    python2.7 \
    python2.7-dev \
    libicu-dev \
    libssl-dev \
    libxml2 \
    git \
    libcurl4-openssl-dev \
    pkg-config && \
    update-alternatives --quiet --install /usr/bin/clang clang /usr/bin/clang-3.6 100 && \
    update-alternatives --quiet --install /usr/bin/clang++ clang++ /usr/bin/clang++-3.6 100 && \
    rm -r /var/lib/apt/lists/*

# Everything up to here should cache nicely between Swift versions, assuming dev dependencies change little
ARG SWIFT_PLATFORM=ubuntu16.04
ARG SWIFT_BRANCH=swift-4.0-branch
ARG SWIFT_VERSION=swift-4.0-DEVELOPMENT-SNAPSHOT-2017-08-04-a

ENV SWIFT_PLATFORM=$SWIFT_PLATFORM \
    SWIFT_BRANCH=$SWIFT_BRANCH \
    SWIFT_VERSION=$SWIFT_VERSION

# Download Swift package, then unpack and cleanup
RUN SWIFT_URL=https://swift.org/builds/$SWIFT_BRANCH/$(echo "$SWIFT_PLATFORM" | tr -d .)/$SWIFT_VERSION/$SWIFT_VERSION-$SWIFT_PLATFORM.tar.gz \
    && curl -fSL $SWIFT_URL -o swift.tar.gz \
    && tar -xzf swift.tar.gz --directory / --strip-components=1

VOLUME /mnt/project

CMD cd /home/developer && /bin/bash --login
