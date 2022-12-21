FROM nvidia/cuda:10.1-base

RUN apt-get update && apt-get install -y mysql-server

COPY my.cnf /etc/mysql/my.cnf

RUN service mysql start && \
    mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root'; FLUSH PRIVILEGES;" && \
    mysql -u root -e "CREATE DATABASE test;"


CMD ["mysqld"]