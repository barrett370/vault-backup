FROM google/cloud-sdk

ENV creds ""

RUN apt install -y cron
RUN systemctl enable cron

COPY copy-cron /etc/cron.d/copy-cron
COPY startup.sh /startup.sh

RUN chmod 0644 /etc/cron.d/copy-cron
RUN crontab /etc/cron.d/copy-cron
RUN touch /var/log/cron.log

CMD cron && tail -f /var/log/cron.log
CMD /startup.sh