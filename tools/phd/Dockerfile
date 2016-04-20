FROM alpine:latest

MAINTAINER rogeriopradoj <rogeriopradoj@gmail.com>

RUN apk add --no-cache php-cli && \
    apk add --no-cache php-pear && \
    apk add --no-cache php-xmlreader && \
    apk add --no-cache php-sqlite3 && \
    apk add --no-cache php-zlib && \
    apk add --no-cache git && \
    rm -rf /var/cache/apk/*

WORKDIR /

RUN git clone http://git.php.net/repository/phd.git && \
    cd phd && \
    pear install package.xml package_generic.xml package_php.xml && \
    cd .. && \
    rm -rf phd

CMD ["/usr/bin/phd"]