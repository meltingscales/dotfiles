#!/bin/bash

DEVICE=foobar
ARCHIVE=/tmp/foobar-backup.disk.gz

gzip --stdout --decompress $ARCHIVE | pv | dd of=/dev/$DEVICE