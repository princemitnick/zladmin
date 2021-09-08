#!/bin/sh
#
# Backup Script
#

USER='backup'
PASS='...'
DIR=/home/tomcat7/backups
PREFIX=mirebalais
REMOTE_DB_SERVER='foo'
REMOTE_DB='...'

# For Pleebo and other environments which can't locate this command
MYSQLDUMP_DIR=/opt/mysql/server-5.6/bin
export PATH=$PATH:${MYSQLDUMP_DIR}

if [ -n "$1" ]
then
  MODIFIER=release_$1
else
  MODIFIER=`date +%Y%m%d-%H%M%S`
fi

FILENAME=${PREFIX}_backup_${MODIFIER}.sql.7z
CURRENT_FILENAME=${PREFIX}_current_backup.sql.7z

# create the needed directories
mkdir -p ${DIR}/current
mkdir -p ${DIR}/sequences

# Dump database, encrypt and compress
mysqldump -u${USER} -p${PASS} --opt --flush-logs --single-transaction openmrs 2>/dev/null | 7za a -p${PASS} -siy -t7z ${DIR}/sequences/${FILENAME} -mx9 2>&1 >/dev/null

if ! [ -s "${DIR}/sequences/${FILENAME}" ]
then
        >&2 echo "mysql backup DB dump file empty\n" 
fi


# link the current to the latest dump
rm -f ${DIR}/current/${CURRENT_FILENAME}
ln -s ${DIR}/sequences/${FILENAME} ${DIR}/current/${CURRENT_FILENAME}

# Copy backup to remote location
# (This is generally handled by crashplan in our newer implementations and not used)
#if [ "$REMOTE_DB_SERVER" != "foo" ]
#then
#	scp ${DIR}/current/${CURRENT_FILENAME} ${REMOTE_DB}/${FILENAME}
#fi
