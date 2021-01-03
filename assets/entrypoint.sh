#!/bin/bash
set -e

FILETAG=$(TZ='Asia/Shanghai' date +'%Y%m%d_%H%M%S')
ARCFILE=/assets/shares/${FILETAG}_build.tar.gz

tar czvf $ARCFILE -C /assets/build .
echo "Done archiving to $ARCFILE"
