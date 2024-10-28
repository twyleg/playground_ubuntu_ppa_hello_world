#!/usr/bin/env bash

SCRIPT_DIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

if [ "$(id -u)" -ne 0 ]; then
        echo "Please run as root. Exiting!"
	exit -1
fi

bash $SCRIPT_DIR/install_runtime_dependencies_arch.sh

pacman -Suy --noconfirm \
        git \
        make \
        cmake \
        gcc \
        nodejs
