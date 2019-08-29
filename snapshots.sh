#!/bin/sh

export B2_ACCOUNT_ID=$(cat /run/secrets/b2_account 2>/dev/null);
export B2_ACCOUNT_KEY=$(cat /run/secrets/b2_application_key 2>/dev/null);

export AWS_ACCESS_KEY_ID=$(cat /run/secrets/s3_key 2>/dev/null)
export AWS_SECRET_ACCESS_KEY=$(cat /run/secrets/s3_secret 2>/dev/null)

export RESTIC_REPOSITORY=$(cat /run/secrets/backup_repository);
export RESTIC_PASSWORD=$(cat /run/secrets/backup_password);

echo "Reading snapshots from ${RESTIC_REPOSITORY}"

restic snapshots
