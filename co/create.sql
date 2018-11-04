DROP TABLE co_contributions;

CREATE TABLE IF NOT EXISTS co_contributions (
    co_id text,
    contributionamount decimal(12,2),
    contributiondate text,
    lastname text,
    firstname text,
    mi text,
    suffix text,
    address1 text,
    address2 text,
    city text,
    state text,
    zip text,
    explanation text,
    recordid text,
    fileddate text,
    contributiontype text,
    receipttype text,
    contributortype text,
    electioneering text,
    committeetype text,
    committeename text,
    candidatename text,
    employer text,
    occupation text,
    amended text,
    amendment text,
    amendedrecordid text,
    jurisdiction text,
    occupationcomments text
);

GRANT ALL ON TABLE co_contributions TO redash_default;
GRANT ALL ON TABLE co_contributions TO politics;

DROP TABLE co_expenditures;

CREATE TABLE IF NOT EXISTS co_expenditures (
    co_id text,
    expenditureamount text,
    expendituredate text,
    lastname text,
    firstname text,
    mi text,
    suffix text,
    address1 text,
    address2 text,
    city text,
    state text,
    zip text,
    explanation text,
    recordid text,
    fileddate text,
    expendituretype text,
    paymenttype text,
    disbursementtype text,
    electioneering text,
    committeetype text,
    committeename text,
    candidatename text,
    employer text,
    occupation text,
    amended text,
    amendment text,
    amendedrecordid text,
    jurisdiction text
);

GRANT ALL ON TABLE co_expenditures TO redash_default;
GRANT ALL ON TABLE co_expenditures TO politics;

DROP TABLE co_loans;

CREATE TABLE IF NOT EXISTS co_loans (
    co_id text,
    paymentamount text,
    paymentdate text,
    name text,
    address1 text,
    address2 text,
    city text,
    state text,
    zip text,
    description text,
    recordid text,
    fileddate text,
    type text,
    loansourcetype text,
    loanamount text,
    loandate text,
    committeetype text,
    committeename text,
    candidatename text,
    interestrate text,
    interestpayment text,
    amended text,
    amendment text,
    amendedrecordid text,
    jurisdiction text,
    loanbalance text
);

GRANT ALL ON TABLE co_loans TO redash_default;
GRANT ALL ON TABLE co_loans TO politics;
