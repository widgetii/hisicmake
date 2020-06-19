#!/usr/bin/env bash

if [ -z ${HISILICON_SDK_DIR} ]; then
  export HISILICON_SDK_DIR=$(pwd)/../..
fi

rm -rf build
cmake -H. -Bbuild -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
  -DCMAKE_TOOLCHAIN_FILE=tools/cmake/toolchains/arm-himix100-linux.cmake \
  -G Ninja
cmake --build build
