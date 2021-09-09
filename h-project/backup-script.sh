#Author : Jean Baptiste Prince Stanley
#!/bin/bash

date_time="$(date +'%d_%m_%y_%H_%M_%S')"
filename="mysql_backup_hsnprod_$date_time".gz
backup_folder="/opt/mysql_backup"
path="$backup_folder/$filename"
logfile="$backup_folder/"backup_log_"$(date +'%Y_%m')".txt

echo "Stop tomcat server"
systemctl stop tomcat
echo "Tomcat server is stopped"

echo "mysqldump started at $(date +'%d-%m-%Y %H:%M:%S') " >> $logfile

mysqldump --user=root --password=xxxx --default-character-set=utf8 hsn | gzip > $path

echo "mysqldump finished at $(date +'%d-%m-%Y %H:%M:%S')" >> $logfile

echo "Operation finished at $(date +'%d-%m-%Y %H:%M:%S')" >> $logfile

echo "*******************************************************************************" >> $logfile

echo "Start tomcat server"
systemctl start tomcat
echo "Tomcat server is started"
