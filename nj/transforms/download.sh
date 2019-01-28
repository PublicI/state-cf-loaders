#!/bin/bash

for file in $(find $1*.txt); do
	wget -N -P $2 "https://www.elec.nj.gov"$file
done
