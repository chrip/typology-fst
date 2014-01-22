project(typology-fst)
cmake_minimum_required(VERSION 2.8)
set (CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")
message (STATUS "Using cmake package path: ${CMAKE_MODULE_PATH}")

set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -Wall")
set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -Wall")

set(CMAKE_BUILD_TYPE "Debug")


aux_source_directory(. SRC_LIST)
add_executable(${PROJECT_NAME} ${SRC_LIST})

find_package(OpenFst)

include_directories(${OPENFST_INCLUDE_DIR})

FIND_LIBRARY(LIBDL_LIB NAMES libdl.so PATHS /usr/lib/ usr/lib64/)
set(LINK_DEPENDENCIES ${OPENFST_LIB} ${LIBDL_LIB})

target_link_libraries(${PROJECT_NAME} ${LINK_DEPENDENCIES})

