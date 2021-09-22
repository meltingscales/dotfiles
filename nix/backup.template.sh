dd if=/dev/foobar conv=sync,noerror bs=64K | pv | gzip -c > /tmp/foobar-backup.disk.gz
