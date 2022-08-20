

mysql -uroot -pmysql --host 127.1 --port 3320 --ssl-mode dis cange -e"select pa.emr_id, per.lastname, per.firstname, per.gender, DATE_FORMAT(pa.created_date, '%d-%m-%Y') as created_date from patient pa inner join person per where pa.id=per.id and pa.emr_id is not null;" > cange.csv



mysql -uroot -pmysql --host 127.1 --port 3320 --ssl-mode dis exchange < data


mysql -uroot -pmysql --host 127.1 --port 3320 --ssl-mode dis verrettes -e"select hivemr, lastname, firstname, gender, DATE_FORMAT(created, '%d-%m-%Y') as created_date from person where hivemr is not null;" > verrettes.csv


# Boucan Carre 
mysql -uroot -pmysql --host 127.1 --port 3320 --ssl-mode dis boucan -e"select pa.emr_id, per.lastname, per.firstname, per.gender, DATE_FORMAT(pa.created_date, '%d-%m-%Y') as created_date from patient pa inner join person per where pa.id=per.id and pa.emr_id is not null;" > boucan.csv


# Cange
mysql -uroot -pmysql --host 127.1 --port 3320 --ssl-mode dis cange -e"select pa.emr_id, per.lastname, per.firstname, per.gender, DATE_FORMAT(pa.created_date, '%d-%m-%Y') as created_date from patient pa inner join person per where pa.id=per.id and pa.emr_id is not null;" > cange.csv

# Belladere 

mysql -uroot -pmysql --host 127.1 --port 3320 --ssl-mode dis belladere -e"select hivemr, lastname, firstname, gender, DATE_FORMAT(created, '%d-%m-%Y') as created_date from person where hivemr is not null;" > belladere.csv

#Hinche 

mysql -uroot -pmysql --host 127.1 --port 3320 --ssl-mode dis hinche -e"select hivemr, lastname, firstname, gender, DATE_FORMAT(created, '%d-%m-%Y') as created_date from person where hivemr is not null;" > hinche.csv

# HUM 

mysql -uroot -pmysql --host 127.1 --port 3320 --ssl-mode dis hum -e"select hivemr, lastname, firstname, gender, DATE_FORMAT(created, '%d-%m-%Y') as created_date from person where hivemr is not null;" > hum.csv

# Lacollines 

mysql -uroot -pmysql --host 127.1 --port 3320 --ssl-mode dis lacollines -e"select hivemr, lastname, firstname, gender, DATE_FORMAT(created, '%d-%m-%Y') as created_date from person where hivemr is not null;" > lacollines.csv

# PRA 

mysql -uroot -pmysql --host 127.1 --port 3320 --ssl-mode dis pra -e"select hivemr, lastname, firstname, gender, DATE_FORMAT(created, '%d-%m-%Y') as created_date from person where hivemr is not null;" > pra.csv

# SSPE 

mysql -uroot -pmysql --host 127.1 --port 3320 --ssl-mode dis sspe -e"select hivemr, lastname, firstname, gender, DATE_FORMAT(created, '%d-%m-%Y') as created_date from person where hivemr is not null;" > sspe.csv
