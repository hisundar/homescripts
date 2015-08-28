#!/bin/bash
if [ $# != 3 ]; then
    echo "Usage: $0 Node1:MemcachedPort Node2:MemcachedPort cbstat_to_compare"
    exit -1
fi
A=$1
B=$2
STAT=$3
NUM_VB_A=`./cbstats $A all | grep ep_vb_total | awk '{print $2}'`
NUM_VB_B=`./cbstats $B all | grep ep_vb_total | awk '{print $2}'`
echo "Comparing vbucket-details stat $STAT across $NUM_VB_A of $A and $B..."
(( --NUM_VB_A ))
for i in $(seq 0 $NUM_VB_A)
do
    echo "comparing vbucket $i..."
   STAT_A=`./cbstats $A vbucket-details $i | grep $STAT | awk '{print $2}'`
   STAT_B=`./cbstats $B vbucket-details $i | grep $STAT | awk '{print $2}'`
   if [ $STAT_A != $STAT_B ]; then
       echo "$STAT in $A $STAT_A != $STAT_B in $B"
   fi
done
