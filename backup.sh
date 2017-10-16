#!/bin/bash

DATE=`date +%Y-%m-%d-%H-%M-%S`
ARCHIVE=${DATE}.sql
BACKUP_DIR=./backups
DATABASE=cashier_development
BUCKET=kit-backups

mysqldump --host=db --user=root --password=root ${DATABASE} > ${BACKUP_DIR}/${ARCHIVE}

duplicity --encrypt-key ${GPG_PUBLIC_KEY} ${BACKUP_DIR} b2://${ACCOUNT}:${APPLICATION_KEY}@${BUCKET}
