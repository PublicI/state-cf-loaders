DROP TABLE al_contributions;

CREATE TABLE IF NOT EXISTS al_contributions (
	orgid text,
	contributionamount decimal(12,2),
	contributiondate text,
	lastname text,
	firstname text,
	mi text,
	suffix text,
	address1 text,
	city text,
	state text,
	zip text,
	contributionid text,
	fileddate text,
	contributiontype text,
	contributortype text,
	committeetype text,
	committeename text,
	candidatename text,
	amended text
);

GRANT ALL ON TABLE al_contributions TO redash_default;
GRANT ALL ON TABLE al_contributions TO politics;

DROP TABLE al_in_kind_contributions;

CREATE TABLE IF NOT EXISTS al_in_kind_contributions (
	orgid text,
	contributionamount decimal(12,2),
	contributiondate text,
	lastname text,
	firstname text,
	mi text,
	suffix text,
	address1 text,
	city text,
	state text,
	zip text,
	inkindcontributionid text,
	fileddate text,
	contributiontype text,
	contributortype text,
	committeetype text,
	committeename text,
	candidatename text,
	amended text,
	natureofinkindcontribution text
);

GRANT ALL ON TABLE al_in_kind_contributions TO redash_default;
GRANT ALL ON TABLE al_in_kind_contributions TO politics;

DROP TABLE al_other_receipts;

CREATE TABLE IF NOT EXISTS al_other_receipts (
	orgid text,
	receiptamount decimal(12,2),
	receiptdate text,
	lastname text,
	firstname text,
	mi text,
	suffix text,
	address1 text,
	city text,
	state text,
	zip text,
	receiptid text,
	fileddate text,
	receipttype text,
	receiptsourcetype text,
	committeetype text,
	committeename text,
	candidatename text,
	amended text,
	endorsername1 text,
	endorseraddress1 text,
	endorserguaranteedamt1 text,
	endorsername2 text,
	endorseraddress2 text,
	endorserguaranteedamt2 text,
	endorsername3 text,
	endorseraddress3 text,
	endorserguaranteedamt3 text
);

GRANT ALL ON TABLE al_other_receipts TO redash_default;
GRANT ALL ON TABLE al_other_receipts TO politics;

DROP TABLE al_expenditures;

CREATE TABLE IF NOT EXISTS al_expenditures (
	orgid text,
	expenditureamount decimal(12,2),
	expendituredate text,
	lastname text,
	firstname text,
	mi text,
	suffix text,
	address1 text,
	city text,
	state text,
	zip text,
	explanation text,
	expenditureid text,
	fileddate text,
	purpose text,
	expendituretype text,
	committeetype text,
	committeename text,
	candidatename text,
	amended text
);

GRANT ALL ON TABLE al_expenditures TO redash_default;
GRANT ALL ON TABLE al_expenditures TO politics;
