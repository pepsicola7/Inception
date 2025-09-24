FROM debian:12

RUN apt-get update \
    && apt-get install -y --no-install-recommends nginx openssl \
    && rm -rf /var/lib/apt/lists/*

#COPY tools/localhost.crt /etc/ssl/certs/localhost.crt
#COPY tools/localhost.key /etc/ssl/private/localhost.key
COPY conf/default.conf /etc/nginx/conf.d/default.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]