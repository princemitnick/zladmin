#!/bin/bash

site=$(whoami)
#. /home/hup/.bash_profile
user="root"
password="wahbahphoeth"
host="localhost"
db_name="openmrs"
db_name_1="isanteplus"



# Path to the backup and the backup date 
backup_path="/opt/.getbackup/"


#Dump database isanteplus
/usr/local/bin/mysqldump --user=$user --password=$password --host=$host $db_name_1 > $backup_path/$site-$db_name_1-current.sql

#Dump database openmrs
/usr/local/bin/mysqldump --user=$user --password=$password --host=$host $db_name > $backup_path/$site-$db_name-current.sql


#Zip backup
tar -czvf $backup_path/pierrepayen-current.tar.gz $backup_path/$site-$db_name_1-current.sql $backup_path/$site-$db_name-current.sql 

scp -v  $backup_path/pierrepayen-current.tar.gz zlcom@108.179.200.178:~/zlbackup/ima/
