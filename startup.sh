#!/usr/bin/env sh

gcloud auth activate-service-account --key-file=/creds/keys.json
crond && tail -f /var/log/cron.log