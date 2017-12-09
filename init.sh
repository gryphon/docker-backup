#!/bin/sh

echo "This will initialize restic B2 repo"

export B2_ACCOUNT_ID=$(cat /run/secrets/b2_account);
export B2_ACCOUNT_KEY=$(cat /run/secrets/b2_application_key);
export RESTIC_REPOSITORY=b2:$(cat /run/secrets/backup_bucket);
export RESTIC_PASSWORD=$(cat /run/secrets/backup_password);

echo "Initializing ${RESTIC_REPOSITORY}"

restic init
