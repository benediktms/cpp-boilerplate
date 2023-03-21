#!/usr/bin/env bash

script_dir=$(dirname -- "$(readlink -f -- "$BASH_SOURCE")")

cd "$script_dir/build" || exit
cmake ..
cd "$script_dir/build/Release" || exit
cmake ../.. -D CMAKE_BUILD_TYPE=Release
cmake --build .
cd "$script_dir" || exit

./bin/Release/Boilerplate

