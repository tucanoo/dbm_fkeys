## Description

This project demonstrates two issues with the changesets generated by dbmGormDiff.

### Expected/Desired outcome

Running dbmGormDiff should yield **_no_** changes.  

### Actual outcome

Changesets are generated, and if the DB is updated with the suggested changes, upon the next run of dbmGormDiff the same changesets are created.  This pattern repeats over and over.

The first changeset relates to a foreign Key - the key point here I believe is that we have an abstract class in combination with hibernate envers for auditing.

The audit tables generated with the suffix "_aud" are the issue as it's these tables the changesets are referring to.

The second issue I'm less sure why it continues to be created, but it's a unique constraint that is constantly dropped and then added,  however this is also specific to one of the "_aud" envers tables.


## Setup

This system is being tested against MariaDB, running on port 3307.  JDK 8 is the JVM version we're working with.

- Run create_schema.sql to create the database and appropriate table schema.

- Update database url and credentials in conf/application.yml

- Run dbmGormDiff to see proposed changeset

 