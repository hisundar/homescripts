perf record -F 99 -p `ps -ef | grep "memcached " | grep -v grep | awk '{print $2}'` --call-graph lbr sleep 15
perf report --stdio > report.txt
