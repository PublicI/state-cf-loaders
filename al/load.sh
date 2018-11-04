#!/bin/bash

psql -U politics -h db.fivetwentyseven.com politics -f create.sql
for year in 2018 2017 2016 2015 2014 2013; do
    wget -N "http://fcpa.alabamavotes.gov/PublicSite/Docs/BulkDataDownloads/"$year"_CashContributionsExtract.csv.zip"
    wget -N "http://fcpa.alabamavotes.gov/PublicSite/Docs/BulkDataDownloads/"$year"_InKindContributionsExtract.csv.zip"
    wget -N "http://fcpa.alabamavotes.gov/PublicSite/Docs/BulkDataDownloads/"$year"_OtherReceiptsExtract.csv.zip"
    wget -N "http://fcpa.alabamavotes.gov/PublicSite/Docs/BulkDataDownloads/"$year"_ExpendituresExtract.csv.zip"
    unzip -o $year"_CashContributionsExtract.csv.zip"
    unzip -o $year"_OtherReceiptsExtract.csv.zip"
    unzip -o $year"_InKindContributionsExtract.csv.zip"
    unzip -o $year"_ExpendituresExtract.csv.zip"
    # try to fix unescaped quotes
    for file in $(\ls *.csv); do
        iconv -f WINDOWS-1252 -t UTF-8 $file | tr -d '\r' > $file.converted
        sed -e 's/\([^,]\)\"\([^,]\)/\1\"\"\2/g' $file.converted | sed -e 's/\(\"\"[^\",]\)\"\([^,]\)/\1\"\"\2/g' | sed -e 's/\(,"[^,]*[^"],\)\"\([^",]\)/\1\"\"\2/g' > $file
        rm $file.converted
    done
    psql -U politics -h db.fivetwentyseven.com politics -c "\COPY al_contributions FROM '"$year"_CashContributionsExtract.csv' WITH CSV HEADER;"
    psql -U politics -h db.fivetwentyseven.com politics -c "\COPY al_in_kind_contributions FROM '"$year"_InKindContributionsExtract.csv' WITH CSV HEADER;"
    psql -U politics -h db.fivetwentyseven.com politics -c "\COPY al_other_receipts FROM '"$year"_OtherReceiptsExtract.csv' WITH CSV HEADER;"
    psql -U politics -h db.fivetwentyseven.com politics -c "\COPY al_expenditures FROM '"$year"_ExpendituresExtract.csv' WITH CSV HEADER;"
    rm $year"_CashContributionsExtract.csv"
    rm $year"_InKindContributionsExtract.csv"
    rm $year"_OtherReceiptsExtract.csv"
    rm $year"_ExpendituresExtract.csv"
done
