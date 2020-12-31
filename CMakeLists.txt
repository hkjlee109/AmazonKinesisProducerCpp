set(CMAKE_OSX_DEPLOYMENT_TARGET ${CMAKE_SYSTEM_VERSION})

cmake_minimum_required(VERSION 3.1)
project(AmazonKinesisProducerCpp)

set(CMAKE_CXX_STANDARD 11)

set(AMAZON_KINESIS_PRODUCER_CPP_SDK_SRC "${CMAKE_CURRENT_SOURCE_DIR}/Library/amazon-kinesis-video-streams-producer-sdk-cpp")

set(CMAKE_MACOSX_RPATH TRUE)
get_filename_component(ROOT "${CMAKE_CURRENT_SOURCE_DIR}" ABSOLUTE)

message(STATUS "@Hello world! ${EXCLUDE_FROM_ALL}")

add_executable(AmazonKinesisProducerCpp Source/main.cpp)
add_subdirectory(${AMAZON_KINESIS_PRODUCER_CPP_SDK_SRC} ./sdk EXCLUDE_FROM_ALL)
