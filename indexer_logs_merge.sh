gunzip indexer.log.*; cat `ls -1 indexer.log* | sort -t. -nk3 -r` > full.log
