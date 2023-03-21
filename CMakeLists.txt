cmake_minimum_required(VERSION 3.26.0)

project(Boilerplate VERSION 0.1.0)


set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

configure_file(include/Config.h.in "${CMAKE_CURRENT_SOURCE_DIR}/include/Config.h")

add_executable(Boilerplate "${CMAKE_CURRENT_SOURCE_DIR}/src/main.cpp")

target_include_directories(Boilerplate PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/include")

set_target_properties(Boilerplate PROPERTIES RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/bin")

target_compile_features(Boilerplate PUBLIC cxx_std_20)

# add compiler warning flags just when building this project
# via the BUILD_INTERFACE generator expression
set(gcc_like_cxx "$<COMPILE_LANG_AND_ID:CXX,ARMClang,AppleClang,Clang,GNU>")
set(msvc_cxx "$<COMPILE_LANG_AND_ID:CXX,MSVC>")

set(gcc_flags "-Wall;-Wextra;-Wshadow;-Wshadow;-Wformat=2")
set(msvc_flags "-W3")

target_compile_options(Boilerplate PRIVATE
   "$<${gcc_like_cxx}:$<BUILD_INTERFACE:${gcc_flags}>>"
   "$<${msvc_cxx}: $<BUILD_INTERFACE:${msvc_flags}>>")

# example of adding compiled library
if (NOT TARGET raylib)
  find_package(raylib 4.2.0 REQUIRED)
endif()

target_link_libraries(Boilerplate raylib)
