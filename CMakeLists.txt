cmake_minimum_required(VERSION 3.13)
project(AmazonKinesisProducerCpp)

set(CMAKE_CXX_STANDARD 11)
set(SDK "${CMAKE_CURRENT_SOURCE_DIR}/Library/sdk")

if(NOT EXISTS ${SDK})
  message(FATAL_ERROR "SDK ${SDK} does not exist.")
endif()

file(GLOB PIC_HEADERS "${SDK}/open-source/amazon-kinesis-video-streams-pic/src/*/include")

include_directories(${PIC_HEADERS})
include_directories(${SDK}/src)
include_directories(${SDK}/src/credential-providers)
include_directories(${SDK}/open-source/amazon-kinesis-video-streams-producer-c/src/include)

option(BUILD_GSTREAMER_PLUGIN "Build kvssink GStreamer plugin" ON)
add_subdirectory(${SDK} ./sdk)

find_package(PkgConfig REQUIRED)

pkg_check_modules(GST_APP REQUIRED gstreamer-app-1.0)
include_directories(${GST_APP_INCLUDE_DIRS})
link_directories(${GST_APP_LIBRARY_DIRS})
link_directories(${CMAKE_CURRENT_BINARY_DIR}/sdk/)

add_executable(AmazonKinesisProducerCpp Source/main.cpp)
target_link_libraries(AmazonKinesisProducerCpp ${GST_APP_LIBRARIES} KinesisVideoProducer)

file(COPY ${SDK}/open-source/local/lib  DESTINATION ${CMAKE_CURRENT_BINARY_DIR})
file(COPY ./Source/kvs_log_configuration  DESTINATION ${CMAKE_CURRENT_BINARY_DIR})
file(COPY ./Source/run.sh  DESTINATION ${CMAKE_CURRENT_BINARY_DIR})
