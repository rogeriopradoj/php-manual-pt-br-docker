FROM rogeriopradoj/php-manual-pt-br-dependencies

MAINTAINER rogeriopradoj <rogeriopradoj@gmail.com>

RUN export REPOSITORIES_TEMP="/repositories_temp" && \
    rm -rf $REPOSITORIES_TEMP && \
    mkdir $REPOSITORIES_TEMP

RUN cd $REPOSITORIES_TEMP && \
    svn checkout https://svn.php.net/repository/phpdoc/modules/doc-en && \
    cd doc-en && \
    php doc-base/configure.php --enable-xml-details && \
    phd --docbook doc-base/.manual.xml --package PHP --format php --output mydocs && \
    cd $REPOSITORIES_TEMP && \
    svn checkout https://svn.php.net/repository/phpdoc/modules/doc-pt_BR && \
    cd doc-pt_BR && \
    php doc-base/configure.php --enable-xml-details --with-lang=pt_BR && \
    phd --docbook doc-base/.manual.xml --package PHP --format php --output mydocs && \
    cd $REPOSITORIES_TEMP && \
    git clone --depth=1 https://github.com/php/web-php.git && \
    rm -r `pwd`/web-php/manual/en && \
    ln -s `pwd`/doc-en/mydocs/php-web `pwd`/web-php/manual/en && \
    ln -s `pwd`/doc-pt_BR/mydocs/php-web `pwd`/web-php/manual/pt_BR
