Запуск Symfony на локальнову компютері.
Крок 1.
Завантажуємо на свій ПК необхідні файли з https://github.com/AlbertRipak/symfony.git

Крок 2.
Запускаємо cmd або можна використовувати наприклад PHPStorm та відкриваємо 
у ньому деректорію з завантажуваними файлами.

Крок 3.
У терміналі cmd вводимо команду docker-compose up.

Крок 4.
Очікуємо наступного повідомлення в терміналі:
---------------------------------------------
database_1  | ERROR: Can't initialize batch_readline - may be the input source is a directory or a block device.
symfony_database_1 exited with code 1
---------------------------------------------

Крок 5.
Заходимо в CLI нашого контейнера з назвою symfony_php-fpm_1
Та копіюємо наступні команди:
---------------------------------------------
git clone https://github.com/javer/symfony5-project.git
cd /symfony/symfony5-project && cp -r ./* /symfony && \
    cp -r .gitignore .env.test .env .git /symfony && \
    cd /symfony && \
    rm -rf ./symfony5-project

sed -i.bak 's/DATABASE_URL=\"postgresql/\# DATABASE_URL=\"postgresql/' ./.env
sed -i 's/\# DATABASE_URL=\"mysql:\/\/db_user:db_password@127.0.0.1:3306\/db_name?serverVersion=5.7\"/DATABASE_URL=\"mysql:\/\/appuser:apppassword@127.0.0.1:3306\/symfony\"/' .env

---------------------------------------------
Ці команди також знаходяться в файлі Symfony/php-fpm/add_git_project.sh

Крок 6.
Переходимо у термінал та натискаємо комбінацію клавіш Ctrl + C
після чого повторно запускаємо команду docker-compose up
та очікуємо повідомлення 
---------------------------------------------
php-fpm_1   | [19-Mar-2021 08:40:45] NOTICE: ready to handle connections
---------------------------------------------
після чого можна перейти в браузер та ввести наступний адрес
---------------------------------------------
http://localhost
---------------------------------------------
Ми маємо побачити домашню сторінку Symfony 5.2.3
