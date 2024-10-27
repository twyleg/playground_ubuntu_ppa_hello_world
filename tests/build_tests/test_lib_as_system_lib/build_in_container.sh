#!/usr/bin/env bash

TZ="Europe/Berlin"


ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone


apt-get update
apt-get install -y \
    build-essential \
    libfmt-dev \
    cmake \
    fish


mkdir -p /workspace/build/
cd /workspace/build/
rm -r ./*
cmake .. -DBUILD_SHARED_LIBS=ON
cmake --build . -- -j5
cmake --install . --prefix /usr


mkdir -p /workspace/tests/build_tests/test_lib_as_system_lib/build
cd /workspace/tests/build_tests/test_lib_as_system_lib/build
rm -r ./*
cmake ..
cmake --build . -- -j5
