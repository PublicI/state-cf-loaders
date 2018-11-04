DROP TABLE in_contributions;

CREATE TABLE IF NOT EXISTS in_contributions (
    filenumber text,
    committeetype text,
    committee text,
    candidatename text,
    contributortype text,
    name text,
    address text,
    city text,
    state text,
    zip text,
    occupation text,
    type text,
    description text,
    amount decimal(12,2),
    contributiondate text,
    received_by text,
    amended text
);

GRANT ALL ON TABLE in_contributions TO redash_default;
GRANT ALL ON TABLE in_contributions TO politics;

DROP TABLE in_expenditures;

CREATE TABLE IF NOT EXISTS in_expenditures (
    filenumber text,
    committeetype text,
    committee text,
    candidatename text,
    expenditurecode text,
    name text,
    address text,
    city text,
    state text,
    zip text,
    occupation text,
    officesought text,
    expendituretype text,
    description text,
    purpose text,
    amount decimal(12,2),
    expenditure_date text,
    amended text
);

GRANT ALL ON TABLE in_expenditures TO redash_default;
GRANT ALL ON TABLE in_expenditures TO politics;
