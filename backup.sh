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

export B2_ACCOUNT_ID=$(cat /run/secrets/b2_account 2>/dev/null);
export B2_ACCOUNT_KEY=$(cat /run/secrets/b2_application_key 2>/dev/null);

export AWS_ACCESS_KEY_ID=$(cat /run/secrets/s3_key 2>/dev/null)
export AWS_SECRET_ACCESS_KEY=$(cat /run/secrets/s3_secret 2>/dev/null)

export RESTIC_REPOSITORY=$(cat /run/secrets/backup_repository);
export RESTIC_PASSWORD=$(cat /run/secrets/backup_password);

echo "Backing up ${BACKUP_DIR} to ${RESTIC_REPOSITORY}"

restic backup ${BACKUP_DIR}

echo "Cleaning backup to one week daily and 2 months weekly"

restic forget --keep-daily 7 --keep-weekly 8

echo "Backup done"