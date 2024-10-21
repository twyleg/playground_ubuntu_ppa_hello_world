#!/usr/bin/env bash

if [ "$(id -u)" -ne 0 ]; then
        echo "Please run as root"
        exit -1
fi

SCRIPT_DIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

docker run -v "$SCRIPT_DIR"/:/example -v "$SCRIPT_DIR"/../../:/hello_world -it ubuntu:oracular /bin/bash -c "bash /example/build_in_container.sh; bash"
