FROM alpine:3.10
LABEL author="Serge NOEL <serge.noel@easylinux.fr>" \
      description="Wordpress Alpine linux image" \
      version="?"
      app="Wordpress"

RUN apk add apache2 php7-apache2 php7-mysqli \
    && mkdir /var/www/html \
    && wget  https://fr.wordpress.org/latest-fr_FR.tar.gz \
    && cd /var/www/html \
    && tar zxvf /latest-fr_FR.tar.gz --strip 1 \
    && rm /latest-fr_FR.tar.gz \
    && chown -R apache: /var/www/html \
    && sed -i 's|/var/www/localhost/htdocs|/var/www/html|g' /etc/apache2/httpd.conf

EXPOSE 80
CMD /usr/sbin/httpd -D FOREGROUND
