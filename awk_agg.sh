grep "P " /dev/shm/fdb.log | awk 'BEGIN {max = 0; } {if ($3 > max) max = $3; } END {  print max; }'
