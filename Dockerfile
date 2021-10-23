FROM google/cloud-sdk:alpine

COPY copy-cron /etc/cron.d/copy-cron
COPY startup.sh /startup.sh

RUN chmod 0644 /etc/cron.d/copy-cron
RUN crontab /etc/cron.d/copy-cron
RUN touch /var/log/cron.log

ENTRYPOINT [ "/startup.sh" ]
