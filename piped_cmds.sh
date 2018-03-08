#!/bin/bash
mkfifo /dev/shm/clustrun_pipe
make -j 8 && cd ns_server/ && echo $? > /dev/shm/clustrun_pipe && ~/startcluster_run.sh
cat /dev/shm/clustrun_pipe && sleep 20 && ~/work/watson/ns_server/cluster_connect -n2 -s 1500 -I 1500 -T n0:kv,n1:kv+index && sleep 40 &&  go test -v -timeout 5000s &> op.log && go test -v -timeout 5000s &> op2.log
