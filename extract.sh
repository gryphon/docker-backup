#!/bin/sh

FILENAME=./backups/2017-10-16-01-36-52

openssl smime -decrypt -in $FILENAME.sql.gz.enc -binary -inform DEM -inkey keys/mysqldump-key.priv.pem -out $FILENAME.sql.gz
gzip -d $FILENAME.sql.gz
