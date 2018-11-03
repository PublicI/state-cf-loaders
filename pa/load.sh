#!/bin/bash

psql -U politics -h db.fivetwentyseven.com politics -f create.sql
for year in 2018 2017 2016 2015 2014 2013; do
    wget -N "https://www.dos.pa.gov/VotingElections/CandidatesCommittees/CampaignFinance/Resources/Documents/"$year".zip"
    unzip -o $year".zip"
    mkdir $year
    for file in $(\ls -d *_$year_*.txt); do
    	mv $file $year/$(echo $file | sed -e 's/\(.*\)_'$year'_.*\.txt$/\1_'$year'.txt/')
    done
	psql -U politics -h db.fivetwentyseven.com politics -c "\COPY pa_contributions FROM '"$year"/contrib_"$year".txt' WITH CSV;"
	psql -U politics -h db.fivetwentyseven.com politics -c "\COPY pa_debts FROM '"$year"/debt_"$year".txt' WITH CSV;"
	psql -U politics -h db.fivetwentyseven.com politics -c "\COPY pa_expenditures FROM '"$year"/expense_"$year".txt' WITH CSV;"
	psql -U politics -h db.fivetwentyseven.com politics -c "\COPY pa_filers FROM '"$year"/filer_"$year".txt' WITH CSV;"
	psql -U politics -h db.fivetwentyseven.com politics -c "\COPY pa_receipts FROM '"$year"/receipt_"$year".txt' WITH CSV;"
    rm -rf $year
done
