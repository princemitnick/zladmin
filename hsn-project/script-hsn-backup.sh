#!/bin/bash
#:Author 		: "Jean Baptiste Prince Stanley" <pstanley@zanmilasante.org>
#:Description	: Save hsn Database
#:Date		: January, 30th 2020
#:Version		: 1.1
date_time="$(date +'%d_%m_%y_%H_%M_%S')"
filename="cange_backup".gz
backup_folder="/opt/mysql_backup/.current"
path="$backup_folder/$filename"
logfile="$backup_folder/"backup_log_"$(date +'%Y_%m')".txt
day="$(date +'%m-%d-%y')"
synology="/mnt/cange/synology/CANGE_HSN/"
synology_path=$synology/$day/


printf "mysqldump started at $(date +'%d-%m-%Y %H:%M:%S')\n " >> $logfile

docker exec mysql-hsn mysqldump --defaults-extra-file=/config.cnf hsn  | gzip > $path

printf "mysqldump finished at $(date +'%d-%m-%Y %H:%M:%S')\n" >> $logfile

printf "Operation finished at $(date +'%d-%m-%Y %H:%M:%S')\n" >> $logfile

printf "************************************************************************************\n" >> $logfile

mount -a
mkdir $synology/$day
cp $path $synology_path
