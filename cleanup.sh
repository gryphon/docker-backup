#!/bin/sh

# Cleanups folder
# Not needed with restic

cd ./backups && ls -tp | grep -v '/$' | tail -n +8 | xargs -I {} rm -- {}
