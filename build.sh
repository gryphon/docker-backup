#!/bin/bash

docker build -t trashtravel/docker-backup:latest . && docker push trashtravel/docker-backup:latest
