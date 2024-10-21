#!/usr/bin/env bash

cd /example

apt-get update
apt-get install -y \
    build-essential \
    libfmt-dev \
    cmake
