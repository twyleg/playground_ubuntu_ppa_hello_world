#!/usr/bin/env bash

SCRIPT_DIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

if [ "$(id -u)" -ne 0 ]; then
        echo "Please run as root. Exiting!"
        exit -1
fi


#
# Example parameters: -j smoke-tests-linux --matrix image:ubuntu:jammy
#
/usr/bin/env act --artifact-server-path $SCRIPT_DIR/../.artifacts $@
