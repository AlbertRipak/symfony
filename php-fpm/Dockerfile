FROM php:fpm-alpine
COPY wait-for-it.sh /usr/bin/wait-for-it
RUN chmod +x /usr/bin/wait-for-it
RUN apk --update --no-cache add git
RUN docker-php-ext-install pdo_mysql
RUN mkdir /symfony
RUN cd /symfony
RUN git clone https://github.com/javer/symfony5-project.git
RUN cd ./symfony5-project
RUN cp -r ./* /symfony
RUN rm -rf ./symfony5-project
COPY --from=composer /usr/bin/composer /usr/bin/composer
WORKDIR /symfony
CMD composer install ; wait-for-it database:3306 -- bin/console doctrine:migrations:migrate ;  php-fpm
EXPOSE 9000