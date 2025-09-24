#!/bin/bash
set -e

# Attendre MariaDB
until mysqladmin ping -h"$WORDPRESS_DB_HOST" -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" --silent; do
    echo "⏳ Waiting for MariaDB..."
    sleep 2
done

WP_PATH=/var/www/wordpress

# Installer WordPress si non installé
if ! wp core is-installed --path="$WP_PATH" --allow-root; then
    echo "⚙️ Configuration de WordPress..."
    wp core config --path="$WP_PATH" \
        --dbname="$MYSQL_DATABASE" \
        --dbuser="$MYSQL_USER" \
        --dbpass="$MYSQL_PASSWORD" \
        --dbhost="$WORDPRESS_DB_HOST" \
        --allow-root

    wp core install --path="$WP_PATH" \
        --url="$WP_URL" \
        --title="$WP_TITLE" \
        --admin_user="$WP_ADMIN_USER" \
        --admin_password="$WP_ADMIN_PASSWORD" \
        --admin_email="$WP_ADMIN_EMAIL" \
        --skip-email \
        --allow-root
fi

# Créer l’utilisateur secondaire
if ! wp user get "$WP_USER" --allow-root --path="$WP_PATH" > /dev/null 2>&1; then
    echo "👤 Création utilisateur secondaire..."
    wp user create "$WP_USER" "$WP_USER_EMAIL" \
        --user_pass="$WP_USER_PASSWORD" \
        --role=author \
        --allow-root \
        --path="$WP_PATH"
fi

echo "🚀 WordPress prêt !"
php-fpm8.2 -F

