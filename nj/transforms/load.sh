#!/bin/bash

psql -f $(dirname "$BASH_SOURCE")/create.sql

for file in $(find $1/ -name "*.txt"); do
    base=$(basename $file .txt)

    psql -c "START TRANSACTION;

    DELETE
    FROM nj_contributions
    WHERE file = '"$base"';

    COPY nj_contributions
    FROM STDIN CSV HEADER;

    COMMIT TRANSACTION;" < $file
done
