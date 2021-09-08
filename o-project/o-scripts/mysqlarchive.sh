#!/bin/sh
#
# Backup cleanup and archiving script
# 

DIR=/home/tomcat7/backups
PREFIX='mirebalais'

YEAR=$(date +"%Y")
MONTH=$(date +"%m")
ARCHIVEFILE=${PREFIX}_backup_${YEAR}${MONTH}01-*.sql.7z

# Create the archive directory
mkdir -p ${DIR}/archive
mkdir -p ${DIR}/archive/${YEAR}

# Archive database on first day of month
[ ! -f ${DIR}/sequences/${ARCHIVEFILE} ] || mv ${DIR}/sequences/${ARCHIVEFILE} ${DIR}/archive/${YEAR}

# Delete all backups (older than 30 days)
find ${DIR}/sequences/ -name "*.7z" -type f -mtime +30 -exec rm -f {} \;

# for referal
# Delete all pre-release backups older than 15 days
#FILENAME=${PREFIX}_backup_20*.sql.7z
#RELEASENAME=${PREFIX}_backup_release_*.sql.7z
#find ${DIR}/sequences/${RELEASENAME} -mtime +15 -exec rm {} \;