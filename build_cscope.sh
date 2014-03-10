#!/bin/bash
# Created by Sundar Sridharan <sundar [dot] sridharan [@] gmail [dot] com>
PWD=`pwd | sed 's/\//\\\\\//g'`
rm cscope.files
find . -name "*.h" > cscope.files.tmp
find . -name "*.hh" >> cscope.files.tmp
find . -name "*.c" >> cscope.files.tmp
find . -name "*.cc" >> cscope.files.tmp
cat cscope.files.tmp | grep -v " " | sed "s/^./$PWD/g">> cscope.files
cscope -b -i cscope.files
rm cscope.files.tmp
