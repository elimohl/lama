#!/bin/bash

OUT_DIRECTORY=$1
mkdir -p $OUT_DIRECTORY

TEMP=`echo {0..29999}.jpg | sed 's/ /\n/g' | sort -R`
echo "$TEMP" | tail -n +4001 > $OUT_DIRECTORY/train_shuffled.flist
echo "$TEMP" | head -n 2000 > $OUT_DIRECTORY/test_shuffled.flist
echo "$TEMP" | head -n 4000 | tail -n 2000 > $OUT_DIRECTORY/val_shuffled.flist
