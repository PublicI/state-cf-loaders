#!/bin/bash

psql -U politics -h db.fivetwentyseven.com politics -f create.sql
for year in 2018 2017 2016 2015 2014 2013; do
    wget -N "http://campaignfinance.in.gov/PublicSite/Docs/BulkDataDownloads/"$year"_ContributionData.csv.zip"
    wget -N "http://campaignfinance.in.gov/PublicSite/Docs/BulkDataDownloads/"$year"_ExpenditureData.csv.zip"
    unzip -o $year"_ContributionData.csv.zip"
    unzip -o $year"_ExpenditureData.csv.zip"
    # try to fix unescaped quotes
    for file in $(\ls *.csv); do
        iconv -c -f WINDOWS-1252 -t UTF-8 $file | tr -d '\r' > $file.converted
        sed -e 's/\([^,]\)\"\([^,]\)/\1\"\"\2/g' $file.converted | sed -e 's/\(\"\"[^\",]\)\"\([^,]\)/\1\"\"\2/g' | sed -e 's/\(,"[^,]*[^"],\)\"\([^",]\)/\1\"\"\2/g' > $file
        rm $file.converted
    done
    psql -U politics -h db.fivetwentyseven.com politics -c "\COPY in_contributions FROM '"$year"_ContributionData.csv' WITH CSV HEADER;"
    psql -U politics -h db.fivetwentyseven.com politics -c "\COPY in_expenditures FROM '"$year"_ExpenditureData.csv' WITH CSV HEADER;"
    rm $year"_ContributionData.csv"
    rm $year"_ExpenditureData.csv"
done
