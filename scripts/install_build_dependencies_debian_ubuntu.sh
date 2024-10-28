#!/usr/bin/env bash

SCRIPT_DIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

if [ "$(id -u)" -ne 0 ]; then
        echo "Please run as root. Exiting!"
        exit -1
fi

bash $SCRIPT_DIR/install_runtime_dependencies_debian_ubuntu.sh

apt-get update
apt-get install -y \
        curl \
        git \
        build-essential \
        cmake \
        g++

curl -fsSL https://deb.nodesource.com/setup_23.x -o nodesource_setup.sh
bash ./nodesource_setup.sh
rm nodesource_setup.sh
apt-get install -y nodejs
