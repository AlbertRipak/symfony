������ Symfony �� ���������� ��������.
���� 1.
����������� �� ��� �� �������� ����� � https://github.com/AlbertRipak/symfony.git

���� 2.
��������� cmd ��� ����� ��������������� ��������� PHPStorm �� ��������� 
� ����� ��������� � ��������������� �������.

���� 3.
� ������� cmd ������� ������� docker-compose up.

���� 4.
������� ���������� ����������� � �������:
---------------------------------------------
database_1  | ERROR: Can't initialize batch_readline - may be the input source is a directory or a block device.
symfony_database_1 exited with code 1
---------------------------------------------

���� 5.
�������� � CLI ������ ���������� � ������ symfony_php-fpm_1
�� ������� ������� �������:
---------------------------------------------
git clone https://github.com/javer/symfony5-project.git
cd /symfony/symfony5-project && cp -r ./* /symfony && \
    cp -r .gitignore .env.test .env .git /symfony && \
    cd /symfony && \
    rm -rf ./symfony5-project

sed -i.bak 's/DATABASE_URL=\"postgresql/\# DATABASE_URL=\"postgresql/' ./.env
sed -i 's/\# DATABASE_URL=\"mysql:\/\/db_user:db_password@127.0.0.1:3306\/db_name?serverVersion=5.7\"/DATABASE_URL=\"mysql:\/\/appuser:apppassword@127.0.0.1:3306\/symfony\"/' .env

---------------------------------------------
ֳ ������� ����� ����������� � ���� Symfony/php-fpm/add_git_project.sh

���� 6.
���������� � ������� �� ��������� ��������� ����� Ctrl + C
���� ���� �������� ��������� ������� docker-compose up
�� ������� ����������� 
---------------------------------------------
php-fpm_1   | [19-Mar-2021 08:40:45] NOTICE: ready to handle connections
---------------------------------------------
���� ���� ����� ������� � ������� �� ������ ��������� �����
---------------------------------------------
http://localhost
---------------------------------------------
�� ���� �������� ������� ������� Symfony 5.2.3
