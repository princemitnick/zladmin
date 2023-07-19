#!/bin/bash
#Description 	: Creer une archive pour l'ensemble des empreintese digitales
#Auteur 		: Jean Baptiste Prince STanley Lovensky J.

DATE=`date +'%d-%m-%y'`
TAR_NAME="fp-hsn-im-$DATE.tar.gz"
DATE_FOR_LOG=`date +'%m-%y'`
LOG_NAME="fp-hsn-img-$DATE_FOR_LOG.log"
_DATE=`date +'%H-%M-%S'`
echo "Started at `date +'%H-%M-%S'`" >> /opt/mysql_backup/.current/$LOG_NAME
tar zcvf /opt/mysql_backup/.current/$TAR_NAME /hsn/
echo "Finished at `date +%H-%M-%S'`" >> /opt/mysql_backup/.current/$LOG_NAME
echo "-------------------------" >> /opt/mysql_backup/.current/$LOG_NAME


scp -v $TAR_NAME zlcom@zanmilasante.org:~/zlbackup/hsn_current/ >> /opt/mysql_backup/.current/send_im.log

##BEFORE EDIT, Please Contact Prince
# pstanley@zanmilasante.org, 34531042
