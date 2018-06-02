# DOCKER RESTIC USAGE

## Setup

You will need the following secrets to be set:

* `b2_account` - backblaze account id
* `b2_application_key` - backblaze app key
* `backup_password` - password to encrypt data
* `backup_bucket` - bucket to backup data

* `backup_db_name` - mysql database name
* `backup_db_user` - mysql user
* `backup_db_password` - mysql password

## Restoring

* Run `snapshots.sh` within container to list all snapshots
* Select ID and run `restore.sh {ID}`
* Check for files at `/backup/restored` folder
