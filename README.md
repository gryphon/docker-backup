# DOCKER RESTIC USAGE

## Setup

You will need the following secrets to be set:

* `b2_account` - backblaze account id (if using b2)
* `b2_application_key` - backblaze app key (if using b2)
* `s3_key` - s3 key (if using s3)
* `b2_secret` - s3 secret (if using s3)
* `backup_password` - password to encrypt data
* `backup_repository` - repository to backup data
  
  for b2: b2:bucket_name
  for s3: s3:s3.amazonaws.com/bucket_name

* `backup_db_name` - mysql database name
* `backup_db_user` - mysql user
* `backup_db_password` - mysql password

## Restoring

* Run `snapshots.sh` within container to list all snapshots
* Select ID and run `restore.sh {ID}`
* Check for files at `/backup/restored` folder
