#!/bin/bash

echo -n "Compress backup..."
gzip $BACKUP_TARGET
echo "done"
