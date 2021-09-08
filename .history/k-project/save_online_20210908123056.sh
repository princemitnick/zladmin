#!/bin/bash
#Author : Jean Baptiste Prince Stanley Lovensky J
#Desc : Ce script.sh est cree pour faire une sauvegarde du systeme de KANJ sur le serveur de zanmilasante
#     : Ce script doit etre lance tous les jours vers 14:45
#     : Creer une tache crontab avec la commande `crontab -e`
#     : Ajouter la ligne suivante
#     : 45 14 * * * bash /home/hms/works/backup/save_online/.script.sh >> /home/hms/works/backup/save_online/kanj.log
#  Replace the site word by the zl site name every where you see it

#Variables
site="hinche"
workdir="/home/hms/works/backup/save_online"
backup_rep="/home1/zlcom/zlbackup/$site/current"
date=`date`

#
echo "================================================== $date" >> $workdir/save_online.sql.log
scp -v $workdir/hinche_bk.sql.gz zlcom@xx.xx.xx.xx:$backup_rep >> $workdir/save_online.sql.log
#
echo "================================================== $date" >> $workdir/save_online.mongo.log

#
scp -v $workdir/hinche_mongodump.tar.gz zlcom@xx.xx.xx.xx:$backup_rep >> $workdir/save_online.mongo.log
scp -v $workdir/fp_images.tar.gz zlcom@xx.xx.xx.xx:$backup_rep >> $workdir/save_online.fp_images.log