cmake_minimum_required(VERSION 3.2)
project(nlopt_test)
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_BUILD_RPATH build)
add_executable(nlopt_test main.cpp)
target_link_libraries(nlopt_test nlopt)
