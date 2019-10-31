# ----------------------------------------------------------------------------
# hello_swig
# ----------------------------------------------------------------------------

cmake_minimum_required (VERSION 3.4)
project (helloSwig C CXX)
set(CMAKE_POSITION_INDEPENDENT_CODE ON)


set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra -std=c++14 -fPIC -fopenmp -W -pedantic -O3 -oFast")

file(GLOB SOURCES
        "${PROJECT_SOURCE_DIR}/src/hello.cpp"
)

include_directories("include")  

add_library(helloSwig STATIC ${SOURCES})