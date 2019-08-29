#!/bin/sh

# --secret b2_account --secret b2_application_key \

docker service create --name="backup" \
  --mount type=bind,source=`pwd`,target=/backup \
  --secret s3_key --secret s3_secret \
  --secret backup_password \
  --secret backup_db_name --secret backup_db_user --secret backup_db_password \
  --secret backup_repository \
  trashtravel/docker-backup
