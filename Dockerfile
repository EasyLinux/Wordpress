FROM alpine:3.9
LABEL author="Serge NOEL <serge.noel@easylinux.fr>"

RUN apk add apache2 php7-apache2
RUN mkdir /var/www/html \
    && wget  https://fr.wordpress.org/latest-fr_FR.tar.gz \
    && cd /var/www/html \
    && tar zxvf /latest-fr_FR.tar.gz --strip 1 \
    && rm /latest-fr_FR.tar.gz
RUN sed -i 's|/var/www/localhost/htdocs|/var/www/html|g' /etc/apache2/httpd.conf
RUN apk add php7-mysqli

EXPOSE 80
CMD /usr/sbin/httpd -D FOREGROUND
