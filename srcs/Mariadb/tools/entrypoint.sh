#!/bin/bash
set -e

# Démarrer MariaDB en arrière-plan
mysqld_safe --skip-networking &
pid="$!"

# Attendre que le serveur démarre
until mysqladmin ping --silent; do
    sleep 1
done

# Initialisation (si pas déjà fait)
mysql -u root <<-EOSQL
    CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;
    CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
    GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO '${MYSQL_USER}'@'%';
    ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
    FLUSH PRIVILEGES;
EOSQL

# Arrêter le serveur temporaire
mysqladmin -u root -p"${MYSQL_ROOT_PASSWORD}" shutdown

# Lancer MariaDB au premier plan (mode conteneur)
exec mysqld_safe

