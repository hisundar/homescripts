if [ $# -eq 0 ]; then
    FILE="ns_server.indexer.log"
else
    FILE=$1
fi

PARAM=storage_commit
VAL=`cat $FILE | grep $PARAM | tr , '\n' | grep $PARAM | tail -1 | awk -F "\":\"" '{print $2}' | awk '{print $2/$1/1000000}'`
echo "$PARAM $VAL"

PARAM=storage_clone_handle
VAL=`cat $FILE | grep $PARAM | tr , '\n' | grep $PARAM | tail -1 | awk -F "\":\"" '{print $2}' | awk '{print $2/$1/1000}'`
echo "$PARAM $VAL"

PARAM=storage_set
VAL=`cat $FILE | grep $PARAM | tr , '\n' | grep $PARAM | tail -1 | awk -F "\":\"" '{print $2}' | awk '{print $2/$1/1000}'`
echo "$PARAM $VAL"

PARAM=storage_del
VAL=`cat $FILE | grep $PARAM | tr , '\n' | grep $PARAM | tail -1 | awk -F "\":\"" '{print $2}' | awk '{print $2/$1/1000}'`
echo "$PARAM $VAL"

PARAM=storage_new_iterator
VAL=`cat $FILE | grep $PARAM | tr , '\n' | grep $PARAM | tail -1 | awk -F "\":\"" '{print $2}' | awk '{print $2/$1/1000}'`
echo "$PARAM $VAL"

PARAM=storage_snapshot_create
VAL=`cat $FILE | grep $PARAM | tr , '\n' | grep $PARAM | tail -1 | awk -F "\":\"" '{print $2}' | awk '{print $2/$1/1000}'`
echo "$PARAM $VAL"

PARAM=storage_snapshot_close
VAL=`cat $FILE | grep $PARAM | tr , '\n' | grep $PARAM | tail -1 | awk -F "\":\"" '{print $2}' | awk '{print $2/$1/1000}'`
echo "$PARAM $VAL"

PARAM=storage_iterator_next
VAL=`cat $FILE | grep $PARAM | tr , '\n' | grep $PARAM | tail -1 | awk -F "\":\"" '{print $2}' | awk '{print $2/$1/1000}'`
echo "$PARAM $VAL"

PARAM=storage_get
VAL=`cat $FILE | grep $PARAM | tr , '\n' | grep $PARAM | tail -1 | awk -F "\":\"" '{print $2}' | awk '{print $2/$1/1000}'`
echo "$PARAM $VAL"

PARAM=storage_info
VAL=`cat $FILE | grep $PARAM | tr , '\n' | grep $PARAM | tail -1 | awk -F "\":\"" '{print $2}' | awk '{print $2/$1/1000}'`
echo "$PARAM $VAL"
