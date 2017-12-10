#!/bin/sh

ARCHIVE=database.sql
BACKUP_DIR=/backup/backups

# MYSQL

DATABASE=$(cat /run/secrets/backup_db_name);
DB_USER=$(cat /run/secrets/backup_db_user);
DB_PASSWORD=$(cat /run/secrets/backup_db_password);
DB_HOST=db

echo "Backing up database to ${BACKUP_DIR}/${ARCHIVE}"

mysqldump --host=${DB_HOST} --user=${DB_USER} --password=${DB_PASSWORD} ${DATABASE} > ${BACKUP_DIR}/${ARCHIVE}

# RESTIC

export B2_ACCOUNT_ID=$(cat /run/secrets/b2_account);
export B2_ACCOUNT_KEY=$(cat /run/secrets/b2_application_key);
export RESTIC_REPOSITORY=b2:$(cat /run/secrets/backup_bucket);
export RESTIC_PASSWORD=$(cat /run/secrets/backup_password);

echo "Backing up ${BACKUP_DIR} to ${RESTIC_REPOSITORY}"

restic backup ${BACKUP_DIR}

echo "Cleaning backup to one week daily and 2 months weekly"

restic forget --keep-daily 7 --keep-weekly 8

echo "Backup done"