#!/bin/sh

echo "This will initialize restic B2 repo"

[ -f /run/secrets/backup_s3_key ] && export AWS_ACCESS_KEY_ID=$(cat /run/secrets/backup_s3_key)
[ -f /run/secrets/backup_s3_secret ] && export AWS_SECRET_ACCESS_KEY=$(cat /run/secrets/backup_s3_secret)

[ -f /run/secrets/backup_repository ] && export RESTIC_REPOSITORY=$(cat /run/secrets/backup_repository);
[ -f /run/secrets/backup_password ] && export RESTIC_PASSWORD=$(cat /run/secrets/backup_password);

echo "Initializing ${RESTIC_REPOSITORY}"

restic init
