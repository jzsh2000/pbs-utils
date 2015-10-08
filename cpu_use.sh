#!/bin/bash

# An EXPECT script, used to interact with `my_cpu_use`
exp_file="$(dirname $(realpath $0))/cpu_use.exp"

if [ -x "$exp_file" ]; then
    exp_out=$($exp_file)
    detail_file=$(echo "$exp_out" | grep -oP '(?<=The details were listed in ).*(?=\.)')

    if [ -n "$detail_file" ]&&[ -f "$detail_file" ]; then
	less "$detail_file"
	rm "$detail_file"
    else
	echo "$exp_out" | sed -n '/^You used/,$p'
    fi
fi
