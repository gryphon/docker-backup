#!/bin/sh

ARCHIVE=database.sql
BACKUP_DIR=/backup/backups

# MYSQL

[ -f /run/secrets/backup_db_params ] && export DB_PARAMS=$(cat /run/secrets/backup_db_params)

mkdir -p ${BACKUP_DIR}
echo "Backing up database to ${BACKUP_DIR}/${ARCHIVE}"

# --host=${DB_HOST} --user=${DB_USER} --password=${DB_PASSWORD} ${DATABASE}
mysqldump ${DB_PARAMS} > ${BACKUP_DIR}/${ARCHIVE}

# RESTIC

[ -f /run/secrets/backup_s3_key ] && export AWS_ACCESS_KEY_ID=$(cat /run/secrets/backup_s3_key)
[ -f /run/secrets/backup_s3_secret ] && export AWS_SECRET_ACCESS_KEY=$(cat /run/secrets/backup_s3_secret)

[ -f /run/secrets/backup_repository ] && export RESTIC_REPOSITORY=$(cat /run/secrets/backup_repository);
[ -f /run/secrets/backup_password ] && export RESTIC_PASSWORD=$(cat /run/secrets/backup_password);

echo "Backing up ${BACKUP_DIR} to ${RESTIC_REPOSITORY}"

restic backup ${BACKUP_DIR}

echo "Cleaning backup to one week daily and 2 months weekly"

restic forget --keep-daily 7 --keep-weekly 8

echo "Backup done"