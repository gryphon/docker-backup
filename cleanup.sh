#!/bin/sh

# Cleanups folder

cd ./backups && ls -tp | grep -v '/$' | tail -n +8 | xargs -I {} rm -- {}
