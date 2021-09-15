#!/bin/bash
#Author: Jean Baptiste Prince Stanley Lovensky J
#DESC : Ce script est ecrit dans le but de faire une sauvegarde integrale du systeme KANJ

date_time="$(date +'%d_%m_%y_%H_%M_%S')"

#Create a mysql dump 
docker exec mysql mysqldump -uroot -pmysql covid_db  | gzip -9 >  /home/hms/works/backup/hinche_bk_$date_time.sql.gz
