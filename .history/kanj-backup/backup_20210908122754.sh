#!/bin/bash
#Author: Jean Baptiste Prince Stanley Lovensky J
#DESC : Ce script est ecrit dans le but de faire une sauvegarde integrale du systeme KANJ
#     : Ce script doit etre lance tous les jours vers 14:30
#     : Creer une tache cron avec la commande `sudo crontab -e`
#     : Ajouter la ligne suivante
#     :  30 14 * * * bash /home/hms/works/backup/.script.sh >> /home/hms/works/backup/kanj.log
#     : Replace the site word by the zl site name every where you see it
#Variables
date_time="$(date +'%d_%m_%y_%H_%M_%S')"

#Compress /hms_id/fp_images /opt/hms/mongo /opt/hms/postgres
tar zcvf  /home/hms/works/backup/save_online/fp_images.tar.gz /hms_id/fp_images
tar zcvf /home/hms/works/backup/mongo.tar.gz /opt/hms/mongo
tar zcvf /home/hms/works/backup/postgres.tar.gz /opt/hms/postgres

#====================================================================================#

#Create a mysqldump (This dump must be send to zanmilasante server)
docker exec mysql mysqldump -uroot -pxxxx id  | gzip -9 >  /home/hms/works/backup/save_online/hinche_bk.sql.gz

#Create a mysql dump 
docker exec mysql mysqldump -uroot -pxxxx id  | gzip -9 >  /home/hms/works/backup/hinche_bk_$date_time.sql.gz

#Create a mongodump within mongo mongo container
docker exec mongo mongodump -uroot -pmongo --db hms --out hinche_mongodump

#Get mongodump from mongo container
docker cp mongo:/hinche_mongodump /home/hms/works/backup/

#Compress mongodump (This dump must be send to zanmilasante server)
tar zcvf /home/hms/works/backup/save_online/hinche_mongodump.tar.gz /home/hms/works/backup/hinche_mongodump

# Compress mongodump
tar zcvf /home/hms/works/backup/hinche_mongodump_$date_time.tar.gz /home/hms/works/backup/hinche_mongodump
