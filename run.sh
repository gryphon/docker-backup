#!/bin/sh

docker service create --name="backup" \
  --mount type=bind,source=`pwd`,target=/backup \
  --secret b2_account --secret b2_application_key \
  --secret backup_password \
  --secret backup_db_name --secret backup_db_user --secret backup_db_password \
  --secret backup_bucket \
  trashtravel/docker-backup
