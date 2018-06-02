#!/bin/sh

export B2_ACCOUNT_ID=$(cat /run/secrets/b2_account);
export B2_ACCOUNT_KEY=$(cat /run/secrets/b2_application_key);
export RESTIC_REPOSITORY=b2:$(cat /run/secrets/backup_bucket);
export RESTIC_PASSWORD=$(cat /run/secrets/backup_password);

echo "Reading snapshots from ${RESTIC_REPOSITORY}"

restic snapshots
