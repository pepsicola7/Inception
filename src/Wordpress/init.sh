#!/bin/bash
set -e

# Attendre que MariaDB soit dispo
until mysqladmin ping -h"$WORDPRESS_DB_HOST" -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" --silent; do
    sleep 2
done

# Vérifier si WordPress est déjà installé
if ! wp core is-installed --path=/var/www/wordpress --allow-root; then
    echo "⚙️ [INIT] Installing WordPress..."

    wp core config --path=/var/www/wordpress \
        --dbname="$MYSQL_DATABASE" \
        --dbuser="$MYSQL_USER" \
        --dbpass="$MYSQL_PASSWORD" \
        --dbhost="$WORDPRESS_DB_HOST" \
        --allow-root || echo "❌ wp core config failed"

    echo "✅ [INIT] core config done"

    wp core install --path=/var/www/wordpress \
        --url="$WP_URL" \
        --title="$WP_TITLE" \
        --admin_user="$WP_ADMIN_USER" \
        --admin_password="$WP_ADMIN_PASSWORD" \
        --admin_email="$WP_ADMIN_EMAIL" \
        --skip-email \
        --allow-root || echo "❌ wp core install failed"

    echo "✅ [INIT] core install done"

    wp user create "$WP_USER" "$WP_USER_EMAIL" \
        --user_pass="$WP_USER_PASSWORD" \
        --role=author \
        --allow-root || echo "❌ wp user create failed"
fi

echo "✅ [INIT] WordPress setup finished"

# Toujours lancer php-fpm
echo "🚀 [INIT] Launching php-fpm..."
exec /usr/sbin/php-fpm8.2 -F




