cmake_minimum_required(VERSION 3.26.0)

project(Boilerplate VERSION 0.1.0)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED True)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

configure_file(include/Config.h.in "${CMAKE_CURRENT_SOURCE_DIR}/include/Config.h")

add_executable(Boilerplate "${CMAKE_CURRENT_SOURCE_DIR}/src/main.cpp")

target_include_directories(Boilerplate PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/include")

set_target_properties(Boilerplate PROPERTIES RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/bin")

