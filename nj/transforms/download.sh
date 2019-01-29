#!/bin/bash

for file in $(find $1/ -name "*.txt"); do
	wget -N -nv -P $2 "https://www.elec.nj.gov"${file#"$1"}
done
