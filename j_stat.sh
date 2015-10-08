#!/bin/bash

# 2015-09-26
user=`whoami`
qstat=`/usr/local/bin/qstat`

if [ -z "$1" ]; then
    job_list=(`echo "$qstat" | awk -v user=$user '$3==user{print $1}'`)
    # echo "$job_list"
else
    job_list=(`echo "$qstat" | grep -iF "$1" | awk '{print $1}'`)
fi

for job_id in ${job_list[@]}
do
    job_name=$(echo "$qstat" | awk -v id=$job_id '$1==id{print $2}')
    echo "[35m========== $job_name ==========[0m"
    /usr/local/bin/j_stat $job_id | tail -n+5
done
