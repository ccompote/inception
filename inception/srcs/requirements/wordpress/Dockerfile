FROM debian:11.8

ARG PHP_VERSION=7.4 \
    DB_NAME \
    DB_USER \
    DB_PASS

RUN apt-get update && \
    apt-get install -y \
    php${PHP_VERSION} \
    php${PHP_VERSION}-fpm \
    php${PHP_VERSION}-mysqli \
    php${PHP_VERSION}-json \
    php${PHP_VERSION}-curl \
    php${PHP_VERSION}-dom \
    php${PHP_VERSION}-exif \
    php${PHP_VERSION}-fileinfo \
    php${PHP_VERSION}-mbstring \
    php${PHP_VERSION}-xml \
    php${PHP_VERSION}-zip \
    wget \
    unzip && \
    sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g" /etc/php/${PHP_VERSION}/fpm/pool.d/www.conf && \
    sed -i "s|;listen.owner = nobody|listen.owner = nobody|g" /etc/php/${PHP_VERSION}/fpm/pool.d/www.conf && \
    sed -i "s|;listen.group = nobody|listen.group = nobody|g" /etc/php/${PHP_VERSION}/fpm/pool.d/www.conf && \
    rm -rf /var/lib/apt/lists/*
#WORKDIR /var/www
#RUN wget https://wordpress.org/latest.zip && \
   # unzip latest.zip && \
  #  cp -rf wordpress/* . && \
 #   rm -rf wordpress latest.zip
#COPY ./requirements/wordpress/conf/wp-config-create.sh .
#RUN sh wp-config-create.sh && rm wp-config-create.sh && \
 #   chmod -R 0777 wp-content/
#CMD ["/usr/sbin/php-fpm8", "-F"]
