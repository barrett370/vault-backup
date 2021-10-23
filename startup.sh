#!/usr/bin/env sh

gcloud auth activate-service-account --key-file=/creds/keys.json
tail -f /var/log/cron.log
