#!/usr/bin/env sh

gcloud auth activate-service-account --key-file=/creds/keys.json
service cron start
