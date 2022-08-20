

mysql -uroot -pmysql --host 127.1 --port 3320 --ssl-mode dis cange -e"select pa.emr_id, per.lastname, per.firstname, per.gender, DATE_FORMAT(pa.created_date, '%d-%m-%Y') as created_date from patient pa inner join person per where pa.id=per.id and pa.emr_id is not null;" > cange.csv



mysql -uroot -pmysql --host 127.1 --port 3320 --ssl-mode dis exchange < data


mysql -uroot -pmysql --host 127.1 --port 3320 --ssl-mode dis verrettes -e"select hivemr, lastname, firstname, gender, DATE_FORMAT(created, '%d-%m-%Y') as created_date from person where hivemr is not null;" > verrettes.csv


# Boucan Carre 
mysql -uroot -pmysql --host 127.1 --port 3320 --ssl-mode dis boucan -e"select pa.emr_id, per.lastname, per.firstname, per.gender, DATE_FORMAT(pa.created_date, '%d-%m-%Y') as created_date from patient pa inner join person per where pa.id=per.id and pa.emr_id is not null;" > boucan.csv

