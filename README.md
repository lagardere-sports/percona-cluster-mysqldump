# About this repo

This is a docker image which creates a backup of a xtradb cluster node via a mysqldump.
You can mount a script at `/backup/backup.sh` to customize the backup (e.g. to copy it to gs).
