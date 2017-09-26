#!/bin/bash
set -e

BACKUP_TARGET=/tmp/${BACKUP_NAME:=backup}.tar

echo -n "Initialize receiver..."
nc -l 4444 > $BACKUP_TARGET &
NC_PID=$!
echo "done"

echo "Initiate backup..."
garbd \
  --address gcomm://$CLUSTER_JOIN \
  --group   $CLUSTER_NAME         \
  --donor   $CLUSTER_NODE         \
  --sst     mysqldump_nc:$(hostname --ip-address)

echo -n "Receiving data..."
wait $NC_PID
echo "done"

if [ -f /backup/backup.sh ]; then source /backup/backup.sh; fi
