# Host

## Master MySQL IP : 192.168.1.29
## Master MySQL Port : 3308

## Slave MySQL IP : 192.168.1.29
## Slave MySQL Port : 3310


# Master Config
## mkdir /var/log/mysql

## chown mysql:mysql /var/log/mysql

## Edit /etc/mysql/my.cnf
## """
## [mysqld]
## server-id = 1
## log_bin = /var/log/mysql/mysql-bin.log
## """

## docker restart covid-mysql

# Setup Mysql Server
## CREATE USER 'hum_user'@'192.168.1.29' IDENTIFIED BY 'mysql';
## GRANT REPLICATION SLAVE ON *.* TO 'hum_slave'@'192.168.1.29';
## FLUSH PRIVILEGES


# Setup Slave Server
## Edit /etc/mysql/my.cnf
## """
## [mysqld]
## server-id = 2
## log_bin = /var/log/mysql/mysql-bin.log
## """