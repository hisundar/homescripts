pkill beamp.smp
pkill epmd
pkill projector
pkill indexer
pkill cbq-engine
pkill cbq
pkill cbq_engine
pkill gometa
ps -ef | grep erl | grep -v grep | awk '{print $2}' | xargs kill
rm -rf /root/work/sherlock/ns_server/data/
rm -rf /root/work/sherlock/ns_server/logs/
rm -rf /root/work/sherlock/ns_server/meta
rm -rf /root/work/sherlock/ns_server/MetadataStore


# Core dumps
export GOTRACEBACK=crash
ulimit -c unlimited
sudo bash -c "echo /tmp/core-%e.%p > /proc/sys/kernel/core_pattern"

make dataclean

COUCHBASE_NUM_VBUCKETS=1024 ./cluster_run --nodes=2
