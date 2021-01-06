#! /bin/sh

PKG_CONFIG_PATH=/usr/lib/i386-linux-gnu/pkgconfig:/usr/lib/pkgconfig \
CC=~/git/AmazonKinesisProducerCpp/Toolchains/gcc-linaro-6.3.1-2017.05-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-gcc \
CFLAGS="-fPIC" \
CXX=~/git/AmazonKinesisProducerCpp/Toolchains/gcc-linaro-6.3.1-2017.05-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-c++ \
CXXFLAGS="-fPIC" \
LD=~/git/AmazonKinesisProducerCpp/Toolchains/gcc-linaro-6.3.1-2017.05-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-ld \
cmake -DBUILD_OPENSSL_PLATFORM=linux-generic32 -S . -B build && cmake --build build
