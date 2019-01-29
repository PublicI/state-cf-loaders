#!/bin/bash

psql -f $(dirname "$BASH_SOURCE")/create.sql

for file in $(find $1/ -name "*.csv"); do
    base=$(basename $file .csv)

    psql -c "START TRANSACTION;

    DELETE
    FROM nj_contributions
    WHERE file = '"$base"';

    COPY nj_contributions
    FROM STDIN CSV HEADER;

    COMMIT TRANSACTION;" < $file
done
