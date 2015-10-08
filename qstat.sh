#!/bin/bash

# qstat -au `whoami`

user=`whoami`
qstat=`/usr/local/bin/qstat`

if echo "$qstat" | awk '{print $3}' | grep -xq "$user"; then
    echo "$qstat" | awk -v user=$user 'NR<=2||$3==user{print}'
fi
