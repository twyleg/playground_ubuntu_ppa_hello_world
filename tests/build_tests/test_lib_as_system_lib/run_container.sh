#!/usr/bin/env bash

if [ "$(id -u)" -ne 0 ]; then
        echo "Please run as root"
        exit -1
fi

SCRIPT_DIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

docker run -v "$SCRIPT_DIR"/../../../:/workspace -it ubuntu:jammy /bin/bash -c "bash /workspace/tests/build_tests/test_lib_as_system_lib/build_in_container.sh; bash"
