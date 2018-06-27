grep memory_size couchbase.log | sed 's/,$//' | awk 'BEGIN {sum=0;} {count += $2;} END {print $1," ",count/1024/1024/1024,"GB";}'
