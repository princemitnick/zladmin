#!/bin/bash
export PATH=/usr/local/sbin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin

AZSECRET='...'
AZURL='....'
AZBACKUPFOLDERPATH='haiti/mirebalais'
DAY=$(date +"%d")

mkdir -p /home/tomcat7/backups/logs
log_file=/home/tomcat7/backups/logs/azcopy.logs

echo $(date +%F-time-%T) >> $log_file

azcopy sync "/home/tomcat7/backups/sequences"  "${AZURL}/${AZBACKUPFOLDERPATH}/sequences?sv=2019-02-02&ss=bfqt&srt=sco&sp=rwdlacup&se=2025-03-29T22:00:00Z&st=2020-03-30T13:00:00Z&spr=https&sig=${AZSECRET}" --recursive=true --delete-destination=false >> $log_file

azcopy sync "/home/tomcat7/backups/archive"  "${AZURL}/${AZBACKUPFOLDERPATH}/archive?sv=2019-02-02&ss=bfqt&srt=sco&sp=rwdlacup&se=2025-03-29T22:00:00Z&st=2020-03-30T13:00:00Z&spr=https&sig=${AZSECRET}" --recursive=true --delete-destination=false >> $log_file