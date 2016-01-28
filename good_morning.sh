cd && \
mv couchbase couchbaseln && \
mv couchbase_bk couchbase && \
cd couchbase && \
repo sync -j 2 && \
cd .. && mv couchbase couchbase_bk && \
mv couchbaseln couchbase && cp -rf couchbase_bk /tmp/ramdisk2g/ ;
echo $? && \
cd couchbase && \
~/build_cscope.sh /tmp/ramdisk2g/build && \
make &&\
rm -rf .repo forestdb testrunner ep-engine && \
ln -s ~/couchbase_bk/.repo .repo && \
ln -s ~/couchbase_bk/testrunner testrunner && \
ln -s ~/forestdb forestdb && \
ln -s ~/couchbase_bk/ep-engine ep-engine &&\
echo $?
echo "If you want to run in testrunner do rm testrunner && cp -rf ~/couchbase_bk/testrunner"
