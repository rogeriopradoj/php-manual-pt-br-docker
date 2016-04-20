FROM rogeriopradoj/php-manual-pt-br-repositories

MAINTAINER rogeriopradoj <rogeriopradoj@gmail.com>

COPY scripts/ /scripts

WORKDIR /repositories_temp

VOLUME /repositories_temp

CMD ["/scripts/0-default.sh"]