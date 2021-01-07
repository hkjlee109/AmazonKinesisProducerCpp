#! /bin/sh

TOOLCHAIN_PATH=$(pwd)/Toolchains/gcc-linaro-6.3.1-2017.05-x86_64_arm-linux-gnueabihf/bin

PKG_CONFIG_PATH=/usr/lib/arm-linux-gnueabihf/pkgconfig:/usr/lib/pkgconfig \
CC=$(TOOLCHAIN_PATH)/arm-linux-gnueabihf-gcc \
CXX=$(TOOLCHAIN_PATH)/arm-linux-gnueabihf-c++ \
LD=$(TOOLCHAIN_PATH)/arm-linux-gnueabihf-ld \
CFLAGS="-fPIC" \
CXXFLAGS="-fPIC" \
cmake -DBUILD_OPENSSL_PLATFORM=linux-generic32 -S . -B build && cmake --build build
