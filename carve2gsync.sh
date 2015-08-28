DISK=`hdiutil attach -nomount ram://4194304`
echo $DISK
sudo /sbin/newfs_msdos -v ramdisk2G $DISK
mkdir -p /tmp/ramdisk2g
sudo /sbin/mount -t msdos -o sync -o noasync $DISK /tmp/ramdisk2g/
