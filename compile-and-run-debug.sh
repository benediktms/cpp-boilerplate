#!/usr/bin/env bash

script_dir=$(dirname -- "$(readlink -f -- "$BASH_SOURCE")")

cd "$script_dir/build" || exit
cmake ..
cd "$script_dir/build/Debug" || exit
cmake ../.. -D CMAKE_BUILD_TYPE=Debug
cmake --build .
cd "$script_dir" || exit

./bin/Debug/Boilerplate

