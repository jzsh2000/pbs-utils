#!/bin/bash

# 2015-10-02
# pbs 脚本延迟提交程序

user=$(whoami)
pbs_script=$1

if [ -z "$pbs_script" ]||[ ! -f "$pbs_script" ]; then
    echo "Usage: $0 PBS_SCRIPT"
    exit
fi

while true
do
    if qstat | grep -q "$user"; then
	sleep 10m
    else
	qsub $1
	exit
    fi
done
