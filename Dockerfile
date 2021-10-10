FROM google/cloud-sdk

ENV creds ""

RUN apt install -y cron
RUN systemctl enable cron
RUN echo "$creds" | base64 -d > keys.json
RUN gcloud auth activate-service-account --key-file=keys.json
COPY copy-cron /etc/cron.d/copy-cron
RUN chmod 0644 /etc/cron.d/copy-cron
RUN crontab /etc/cron.d/copy-cron
RUN touch /var/log/cron.log

CMD cron && tail -f /var/log/cron.log