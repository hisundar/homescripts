X="\$3"
if [ $# -gt 1 ]
    then
    X="\$$2"
fi
PLINE=0
if [ $# -eq 3 ]
    then
    PLINE=1
fi

if [ $PLINE -eq 1 ]
    then
    cat $1 | grep "\d,\d" | awk -F"," "BEGIN {sum = 0; count = 0;} { print $X; sum += $X count++; } END {  print \"total=\", sum, count, \"Avg=\", sum/count; }"
else
    cat $1 | grep "\d,\d" | awk -F"," "BEGIN {sum = 0; count = 0;} { sum += $X count++; } END {  print \"total=\", sum, count, \"Avg=\", sum/count; }"
fi
