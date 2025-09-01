#!/bin/bash
set -e

# Attendre que MariaDB soit prêt (sinon WordPress plante)
sleep 5

wp config create	--allow-root \
					--dbname=${MYSQL_DATABASE} \
    				--dbuser=${MYSQL_USER} \
    				--dbpass=${MYSQL_PASSWORD} \
    				--dbhost=mariadb:3306 --path='/var/www/wordpress'

wp core install 	--allow-root \
					--url=${WP_URL} \
					--title=${WP_TITLE} \
					--admin_user=${WP_ADMIN_USER} \
					--admin_password=${WP_ADMIN_PASSWORD} \
					--admin_email=${WP_ADMIN_EMAIL}

wp user create 		${WP_USER} ${WP_USER_EMAIL} \
				    --user_pass=${WP_USER_PASSWORD} \
    				--role=author \
    				--allow-root
