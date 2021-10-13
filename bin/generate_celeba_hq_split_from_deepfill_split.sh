#!/bin/bash

DEEPFILL_TRAIN=$1
DEEPFILL_VAL=$2
OUT_DIRECTORY=$3
mkdir -p $OUT_DIRECTORY

cat $DEEPFILL_VAL | sed -r 's/img0*([0-9]+).png/\1.jpg/' > $OUT_DIRECTORY/test_shuffled.flist
TEMP=`cat $DEEPFILL_TRAIN | sed -r 's/img0*([0-9]+).png/\1.jpg/'`
echo "$TEMP" | tail -n +2001 > $OUT_DIRECTORY/train_shuffled.flist
echo "$TEMP" | head -n 2000 > $OUT_DIRECTORY/val_shuffled.flist
