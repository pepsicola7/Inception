#!/bin/bash
set -e

# Attendre que MariaDB démarre
until mysqladmin ping -h "localhost" --silent; do
    echo "⏳ Waiting for MariaDB to be ready..."
    sleep 2
done

# Initialiser la base et l'utilisateur
mysql -u root -p"$MYSQL_ROOT_PASSWORD" <<-EOSQL
    CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;

    # Créer l'utilisateur pour toutes les connexions (%)
    CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
    GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';

    # Créer l'utilisateur pour localhost (connexion interne au container)
    CREATE USER IF NOT EXISTS '$MYSQL_USER'@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD';
    GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'localhost';

    FLUSH PRIVILEGES;
EOSQL

