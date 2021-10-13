#!/bin/bash
#Author: Jean Baptiste Prince Stanley Lovensky J
#DESC : Ce script est ecrit dans le but de faire une sauvegarde integrale du systeme KANJ

date_time="$(date +'%d_%m_%y_%H_%M_%S')"

#Create a mysql dump 
docker exec covid-mysql mysqldump -uroot -pxxxx covid_db  | gzip -9 >  /home/hms/works/backup_covid/hum_c19rtr_$date_time.sql.gz

