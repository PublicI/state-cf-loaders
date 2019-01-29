#!/bin/bash

for file in $(find $1*.txt); do
    base=$(basename $file .txt)
    tr -d '\r' < $file | sed -e 's/$/,'$base'/' > $2/$base.csv
done
