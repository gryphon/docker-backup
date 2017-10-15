#!/bin/bash

DATE=`date +%Y-%m-%d-%H-%M-%S`
ARCHIVE=${DATE}.sql.gz.enc
BACKUP_DIR=./backups
DATABASE=cashier_development
PUBLIC_KEY=keys/mysqldump-key.pub.pem

mysqldump --host=db --user=root --password=root ${DATABASE} \
  | gzip -c \
  | openssl smime -encrypt -binary -text -aes256 -out ${BACKUP_DIR}/${ARCHIVE} -outform DER ${PUBLIC_KEY}
  