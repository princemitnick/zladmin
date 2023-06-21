#!/bin/bash
bash /opt/hms/conf/run_pgd.sh start

id_repository=/opt/hms/conf/id
cd $id_repository

java -jar $id_repository/id-1.0.3.jar &
