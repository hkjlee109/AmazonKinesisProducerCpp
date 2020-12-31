cmake_minimum_required(VERSION 3.16)
project(AmazonKinesisProducerCpp)

set(CMAKE_CXX_STANDARD 11)

set(AMAZON_KINESIS_PRODUCER_CPP_SDK_SRC "${CMAKE_CURRENT_SOURCE_DIR}/Library/amazon-kinesis-video-streams-producer-sdk-cpp")

include_directories(${AMAZON_KINESIS_PRODUCER_CPP_SDK_SRC}/src)

add_executable(AmazonKinesisProducerCpp Source/main.cpp)
add_subdirectory(${AMAZON_KINESIS_PRODUCER_CPP_SDK_SRC} ./sdk)
