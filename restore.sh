#!/bin/sh

ARCHIVE=database.sql
BACKUP_DIR=/backup/backups

snapshot=$1

# MYSQL

DATABASE=$(cat /run/secrets/backup_db_name);
DB_USER=$(cat /run/secrets/backup_db_user);
DB_PASSWORD=$(cat /run/secrets/backup_db_password);
DB_HOST=db

# RESTIC

export B2_ACCOUNT_ID=$(cat /run/secrets/b2_account);
export B2_ACCOUNT_KEY=$(cat /run/secrets/b2_application_key);
export RESTIC_REPOSITORY=b2:$(cat /run/secrets/backup_bucket);
export RESTIC_PASSWORD=$(cat /run/secrets/backup_password);

echo "Restoring ${snapshot} to /backup/restored"

restic restore $snapshot --target /backup/restored

echo "Restoring done"
