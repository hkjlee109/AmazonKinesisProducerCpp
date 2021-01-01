cmake_minimum_required(VERSION 3.16)
project(AmazonKinesisProducerCpp)

set(CMAKE_CXX_STANDARD 11)
set(AMAZON_KINESIS_PRODUCER_CPP_SDK_SRC "${CMAKE_CURRENT_SOURCE_DIR}/Library/amazon-kinesis-video-streams-producer-sdk-cpp")

if(NOT EXISTS ${AMAZON_KINESIS_PRODUCER_CPP_SDK_SRC})
  message(FATAL_ERROR "AMAZON_KINESIS_PRODUCER_CPP_SDK_SRC ${AMAZON_KINESIS_PRODUCER_CPP_SDK_SRC} does not exist.")
endif()

file(GLOB PIC_HEADERS "${AMAZON_KINESIS_PRODUCER_CPP_SDK_SRC}/open-source/amazon-kinesis-video-streams-pic/src/*/include")

include_directories(${PIC_HEADERS})
include_directories(${AMAZON_KINESIS_PRODUCER_CPP_SDK_SRC}/src)
include_directories(${AMAZON_KINESIS_PRODUCER_CPP_SDK_SRC}/src/credential-providers)
include_directories(${AMAZON_KINESIS_PRODUCER_CPP_SDK_SRC}/open-source/amazon-kinesis-video-streams-producer-c/src/include)

option(BUILD_GSTREAMER_PLUGIN "Build kvssink GStreamer plugin" ON)
add_subdirectory(${AMAZON_KINESIS_PRODUCER_CPP_SDK_SRC} ./sdk)

find_package(PkgConfig REQUIRED)

pkg_check_modules(GST_APP REQUIRED gstreamer-app-1.0)
include_directories(${GST_APP_INCLUDE_DIRS})
link_directories(${GST_APP_LIBRARY_DIRS})
link_directories(${CMAKE_CURRENT_BINARY_DIR}/sdk/)

add_executable(AmazonKinesisProducerCpp Source/main.cpp)
target_link_libraries(AmazonKinesisProducerCpp ${GST_APP_LIBRARIES} KinesisVideoProducer)

configure_file(./Source/kvs_log_configuration ${CMAKE_CURRENT_BINARY_DIR} COPYONLY)
