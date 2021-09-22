#!/bin/bash

DEVICE=foobar
OUTPUTFILE=/tmp/foobar-backup.disk.gz

dd if=/dev/$DEVICE conv=sync,noerror bs=64K | pv | gzip -c > $OUTPUTFILE
