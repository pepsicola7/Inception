
FROM debian:12

RUN apt-get update && apt-get install -y mariadb-server \
	&& rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/run/mysqld /var/lib/mysql \
    && chown -R mysql:mysql /var/run/mysqld /var/lib/mysql

# Copier le script d’init
COPY tools/init.sh /docker-entrypoint-initdb.d/init.sh
RUN chmod +x /docker-entrypoint-initdb.d/init.sh

EXPOSE 3306

CMD ["mysqld_safe"]
#CMD ["sh", "/docker-entrypoint-initdb.d/init.sh"]
#CMD ["sleep", "infinity"] 