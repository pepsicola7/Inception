FROM debian:12

RUN apt-get update && apt-get install -y \
    php8.2 \
    php8.2-cli \
    php8.2-mysql \
    php8.2-fpm \
    mariadb-client \
    wget \
    unzip \
    curl \
    less \
    php8.2-gd \
    php8.2-curl \
    php8.2-mbstring \
    php8.2-xml \
    php8.2-zip \
    php8.2-intl \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /var/www

RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -O /tmp/wordpress.tar.gz \
 && tar -xzf /tmp/wordpress.tar.gz -C /var/www \
 && rm /tmp/wordpress.tar.gz

RUN mkdir -p /var/www/wordpress/wp-content/uploads \
 && chown -R www-data:www-data /var/www/wordpress \
 && chmod -R 755 /var/www/wordpress

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
 && chmod +x wp-cli.phar \
 && mv wp-cli.phar /usr/local/bin/wp

COPY conf/www.conf /etc/php/8.2/fpm/pool.d/www.conf
COPY init.sh /init.sh
RUN chmod +x /init.sh

EXPOSE 9000
ENTRYPOINT ["/init.sh"]




