curl http://127.0.0.1:9102/stats -u Administrator/asdasd | json_pp | grep data_size | sed 's/,$//' | awk 'BEGIN {sum=0;} {sum += $3;} END {print sum;}'
