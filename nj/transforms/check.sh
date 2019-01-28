#!/bin/bash

CONTRIBS_URL=https://www.elec.nj.gov/publicinformation/contrib_quickdownload.htm
CONTRIBS_RESPONSES=$(wget -nd -r -w 1 -e robots=off -S --spider --level 1 -I /download/ --accept "*.txt" $CONTRIBS_URL 2>&1)
CONTRIBS_RESPONSE_LINES=$(echo $CONTRIBS_RESPONSES | grep -o '/[^.]*\.txt[^/]*\/1.1 200 OK Content-Length: [0-9]* Content-Type: text\/plain Last-Modified: [A-Za-z]*, [0-9]* [A-Za-z]* [0-9]* [0-9]*:[0-9]*:[0-9]* GMT Accept-Ranges: bytes ETag: "[^"]*"')

while read file response; do
	response=$(echo $response | grep -o 'Content-Length: .*')
	# base=$(basename $file)
	mkdir -p $1$(dirname $file)
  	echo "$response" > $1"$file"
done < <(echo "$CONTRIBS_RESPONSE_LINES")
