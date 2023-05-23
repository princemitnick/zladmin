#!/bin/bash
date_time="$(date +'%d_%m_%y_%H_%M_%S')"
day="$(date +'%m-%d-%y')"
synology="/mnt/thomonde/synology/THOMONDE_OPENMRS/"
synology_path=$synology/$day/



mysqldump -uopenmrs -pA15Omed1nf@R0x openmrs | gzip -9 > /home/prince/.omrs-backup/thomonde_mysql_omrs_$date_time.sql.gz

sudo mount -a
sudo mkdir $synology/$day
sudo cp /home/prince/.omrs-backup/thomonde_mysql_omrs_$date_time.sql.gz $synology_path
