#!/usr/bin/env bash

if [ "$(id -u)" -ne 0 ]; then
        echo "Please run as root. Exiting!"
        exit -1
fi

apt-get update
apt-get install -y \
        libfmt-dev
