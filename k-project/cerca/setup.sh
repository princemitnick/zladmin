mkdir -p /opt/cerca/hms/

mkdir /home/hms/hms-implementation/cerca/
cp docker-compose.yml /home/hms/hms-implementation/cerca/

mkdir /hms_id/cerca/fp_images -p

mkdir -p /opt/pgd 

cp run_pgd.sh /opt/pgd/
cp run_pgd.service /etc/systemd/system/
systemctl daemon-reload
systemctl start run-pgd