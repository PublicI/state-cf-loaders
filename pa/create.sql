DROP TABLE pa_contributions;

CREATE TABLE IF NOT EXISTS pa_contributions (
	filerid text,
	eyear integer, 
	cycle integer,
	section text,
	contributor text,
	address1 text,
	address2 text,
	city text,
	state text,
	zipcode text,
	occupation text,
	ename text,
	eaddress1 text,
	eaddress2 text,
	ecity text,
	estate text,
	ezipcode text,
	contdate1 text,
	contamt1 decimal(12,2),
	contdate2 text,
	contamt2 decimal(12,2),
	contdate3 text,
	contamt3 decimal(12,2),
	contdesc text
);

DROP TABLE pa_debts;

CREATE TABLE IF NOT EXISTS pa_debts (
	filerid text,
	eyear integer, 
	cycle integer,
	dbtname text,
	address1 text,
	address2 text,
	city text,
	state text,
	zipcode text,
	dbtdate text,
	dbtamt decimal(12,2),
	dbtdesc text
);

DROP TABLE pa_expenditures;

CREATE TABLE IF NOT EXISTS pa_expenditures (
	filerid text,
	eyear integer, 
	cycle integer,
	expname text,
	address1 text,
	address2 text,
	city text,
	state text,
	zipcode text,
	expdate text,
	expamt decimal(12,2),
	expdesc text
);

DROP TABLE pa_filers;

CREATE TABLE IF NOT EXISTS pa_filers (
	filerid text,
	eyear integer,
	cycle integer,
	ammend text,
	terminate text,
	filertype text,
	filername text,
	office text,
	district text,
	party text,
	address1 text,
	address2 text,
	city text,
	state text,
	zipcode text,
	county text,
	phone text,
	beginning decimal(12,2),
	monetary decimal(12,2),
	inkind decimal(12,2)
);

DROP TABLE pa_other_receipts;

CREATE TABLE IF NOT EXISTS pa_other_receipts (	
	filerid text,
	eyear integer, 
	cycle integer,
	recname text,
	address1 text,
	address2 text,
	city text,
	state text,
	zipcode text,
	recdesc text,
	recdate text,
	recamt decimal(12,2)
);
