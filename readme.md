This project demonstrates two issues with the changesets generated by dbmGormDiff.

In each case the main problem is that these changeset generate repeatedly, so even after running the sql to update th DB, running dbmGormDiff again will produce the same changes.

The first changeset relates to a Foreign Key - the key here I believe is that we have a abstract class, and we're using hibernate envers for auditing.
The audit table generated with the suffix "_aud" repeatedly wants to add and then drop a the foreign key.

The second issue I'm less sure why it continues to be created, but it's a unique constraint that is constantly dropped and then added.

 