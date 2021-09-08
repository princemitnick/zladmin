#!/bin/sh
#
# Backup Script
#

USER='backup'
PASS='c&r&J@-dO-R10-g7@nd&'
DIR=/home/tomcat7/backups
PREFIX=mirebalais
REMOTE_DB_SERVER='amigo.pih-emr.org'
REMOTE_DB='backups@amigo.pih-emr.org:haiti/mirebalais/db'

# For Pleebo and other environments which can't locate this command
MYSQLDUMP_DIR=/opt/mysql/server-5.6/bin
export PATH=$PATH:${MYSQLDUMP_DIR}


# Copy backup to remote location
# (This is generally handled by crashplan in our newer implementations and not used)
if [ "$REMOTE_DB_SERVER" != "foo" ]
then
	scp ${DIR}/current/${CURRENT_FILENAME} ${REMOTE_DB}/${FILENAME}
fi


