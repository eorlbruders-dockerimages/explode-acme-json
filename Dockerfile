FROM registry.eorlbruder.de/cron
MAINTAINER  David Magnus Henriques <eorlbruder@magnus-henriques.de>

RUN pacman -Syyu --noconfirm --quiet --needed --force python && \
    pacman -Sc --noconfirm

ADD assets/dumpcerts.sh /dumpcerts.sh
ADD assets/dumpcerts.python /dumpcerts.python

ADD assets/fcrontab /etc/fcrontab
RUN fcrontab /etc/fcrontab

RUN mkdir /certs
RUN mkdir /acme

CMD ["supervisord", "-n"]
