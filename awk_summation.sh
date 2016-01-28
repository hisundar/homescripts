cat good.log | grep "SnapCreateDur" | awk '{printf("%f\n", $22)}' | awk 'BEGIN {sum=0; count=0;} {sum +=$1; count++;} END{ print "avg=",sum/count,"count=",count}'
 sundar$ cat good.log | grep "SnapCreateDur" | awk '{unit=substr($22, length($22) - 2, length($22)); val=substr($22, 0, length($22) - length(unit)); print val;}'
