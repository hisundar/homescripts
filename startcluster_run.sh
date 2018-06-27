pkill beamp.smp
pkill epmd
pkill projector
pkill indexer
pkill cbq-engine
pkill cbq
pkill cbq_engine
pkill gometa
ps -ef | grep erl | grep -v grep | awk '{print $2}' | xargs kill
rm -rf data/
rm -rf logs/
rm -rf meta
rm -rf MetadataStore

# Core dumps
export GOTRACEBACK=crash
export CBFT_ENV_OPTIONS=bleveMaxResultWindow=10000000
ulimit -c unlimited
ulimit -n 65535
sudo bash -c "echo /tmp/core-%e.%p > /proc/sys/kernel/core_pattern"

make dataclean

COUCHBASE_NUM_VBUCKETS=1024 ./cluster_run --nodes=2
