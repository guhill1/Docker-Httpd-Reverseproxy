FROM httpd:latest

MAINTAINER SaravAK (aksarav@middlewareinventory.com)

COPY httpd.conf /usr/local/apache2/conf/httpd.conf

RUN mkdir -p /usr/local/apache2/conf/sites/

RUN if command -v a2enmod >/dev/null 2>&1; then \
        a2enmod rewrite headers \
    ;fi

ADD . /var/www/html

EXPOSE 80

CMD ["httpd", "-D", "FOREGROUND"]
