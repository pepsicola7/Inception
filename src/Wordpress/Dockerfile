FROM debian:12

# Installer les paquets nécessaires
RUN apt-get update && \
	apt-get install -y \
			php8.2 \
			php8.2-cli \
			php8.2-mysql \
			php8.2-fpm \
			mariadb-client \
			wget \
			unzip \
			curl \
			less \
		&& rm -rf /var/lib/apt/lists/*


# Télécharger et installer WordPress
RUN mkdir -p /var/www && \
    wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -O /var/www/wordpress.tar.gz && \
    tar -xzf /var/www/wordpress.tar.gz -C /var/www && \
    rm /var/www/wordpress.tar.gz

# Donner les permissions correctes
RUN chown -R www-data:www-data /var/www/wordpress

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod 755 wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

COPY init.sh /init.sh
RUN chmod +x /init.sh
	
# Lancer le script d'initialisation par défaut
CMD ["/init.sh"]

