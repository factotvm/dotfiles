#!/bin/sh

# instead of realpath
cd $(dirname $0)
script_path=$(pwd)

for file in $script_path/link/*; do
  ln -sf $file ~/.$(basename $file)
done
