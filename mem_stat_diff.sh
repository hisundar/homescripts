OP=`./cbstats 127.0.0.1:12000 raw memory | grep "mem_used\|total_allocat\|total_free\|total_heap"`; echo $OP | awk '{print $2 "\n" ($4 + $6 + $8)}'
