#!/bin/sh

docker service create --name="backup" --secret gpg_public_key --secret b2_account --secret b2_application_key trashtravel/docker-backup
