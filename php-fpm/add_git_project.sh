#!/bin/sh

git clone https://github.com/javer/symfony5-project.git
cd /symfony/symfony5-project && cp -r ./* /symfony && \
    cp -r .gitignore .env.test .env .git /symfony && \
    cd /symfony && \
    rm -rf ./symfony5-project

sed -i.bak 's/DATABASE_URL=\"postgresql/\# DATABASE_URL=\"postgresql/' ./.env
sed -i 's/\# DATABASE_URL=\"mysql:\/\/db_user:db_password@127.0.0.1:3306\/db_name?serverVersion=5.7\"/DATABASE_URL=\"mysql:\/\/appuser:apppassword@127.0.0.1:3306\/symfony\"/' .env
