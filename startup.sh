#!/usr/bin/env sh

# echo "$creds" | base64 -d > keys.json
gcloud auth activate-service-account --key-file=/creds/keys.json
cron && tail -f /var/log/cron.log
