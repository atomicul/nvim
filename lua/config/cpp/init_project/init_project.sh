#!/bin/bash
dir=$1
script_dir="/home/pijon/.config/nvim/lua/config/cpp/init_project"

touch "$dir/main.cpp"
mkdir "$dir/include"
mkdir "$dir/src"
cp "$script_dir/CMakeLists.txt" $dir
