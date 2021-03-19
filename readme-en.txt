Launch Symfony on the docker.

Step 1.
Download files from https://github.com/AlbertRipak/symfony.git.

Step 2.
I can use CMD or PHPStorm.
Open the directory in CMD or PHPStorm where you saved files.

Step 3.
Write the command in CMD: docker-compose up

Step 4. 
If you see a message:
---------------------------------------------
database_1  | ERROR: Can't initialize batch_readline - may be the input source is a directory or a block device.
symfony_database_1 exited with code 1
---------------------------------------------
Go to the next step.

Step 5.
Open CLI in the docker container symfony_php-fpm_1
You should copy these commands to the terminal:
---------------------------------------------
git clone https://github.com/javer/symfony5-project.git
cd /symfony/symfony5-project && cp -r ./* /symfony && \
    cp -r .gitignore .env.test .env .git /symfony && \
    cd /symfony && \
    rm -rf ./symfony5-project

sed -i.bak 's/DATABASE_URL=\"postgresql/\# DATABASE_URL=\"postgresql/' ./.env
sed -i 's/\# DATABASE_URL=\"mysql:\/\/db_user:db_password@127.0.0.1:3306\/db_name?serverVersion=5.7\"/DATABASE_URL=\"mysql:\/\/appuser:apppassword@127.0.0.1:3306\/symfony\"/' .env

---------------------------------------------

Step 6.
Return to the CMD terminal and press Ctrl + C.
Repeat the command: docker-compose up
When you see the message 
---------------------------------------------
php-fpm_1   | [19-Mar-2021 08:40:45] NOTICE: ready to handle connections
---------------------------------------------
Go to browser and enter http://localhost