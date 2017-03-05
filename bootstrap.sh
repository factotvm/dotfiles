#!/usr/bin/env sh

# Instead of realpath
cd $(dirname $0)

# Set script_path to working directory
script_path=$(pwd)

# Link items
find "$script_path/link" -maxdepth 1 | while read item; do
  echo "Linking: $item"
  ln -sf $item ~/.$(basename $item)
done

# Make a pass deleting stale links, if any
for i in ~/.*; do
    [ ! -h $i ] && continue

    # We have a link: Is it stale? If so, delete it ...
    if [ ! -f $i ] && [ ! -d $i ]; then
        echo "Deleting stale link: $i"
        rm $i
    fi
done
