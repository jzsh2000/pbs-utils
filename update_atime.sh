#!/usr/bin/env bash

# Update access time of files or directories

if [ "$#" -eq 0 ]; then
    echo "Usage: $0 <FILE | DIR>..."
fi

for file in $@
do
    if [ -f "$file" ]; then
	# change only the access time
	touch -a "$file"
    elif [ -d "$file" ]; then
	find "$file" -name '*' -exec touch -a {} \;
    else
	echo "Warning: cannot locate '$file'" >&2
    fi
done
