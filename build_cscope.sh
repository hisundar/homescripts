#!/bin/bash
# Created by Sundar Sridharan <sundar [dot] sridharan [@] gmail [dot] com>
if [ $# -eq 0 ]
    then
        OUTPUT_DIR=.
    else
        OUTPUT_DIR=$1
fi

PWD=`pwd | sed 's/\//\\\\\//g'`
if [ -e $OUTPUT_DIR/cscope.files ]; then
    rm $OUTPUT_DIR/cscope.files
fi

find . -name "*.h" > $OUTPUT_DIR/cscope.files.tmp
find . -name "*.hh" >> $OUTPUT_DIR/cscope.files.tmp
find . -name "*.c" >> $OUTPUT_DIR/cscope.files.tmp
find . -name "*.cc" >> $OUTPUT_DIR/cscope.files.tmp
cat $OUTPUT_DIR/cscope.files.tmp | grep -v " " | sed "s/^./$PWD/g">> $OUTPUT_DIR/cscope.files
cd $OUTPUT_DIR
cscope -b -i cscope.files
rm cscope.files.tmp
