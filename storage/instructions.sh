# IP_RANGE : .5



# -- ENABLE NFS
# -- CREATE STORAGE FOR OPENMRS, HSN and KANJ SYSTEM
# -- ADD NFS PERMISSION (R/W) on ALL FILES

# MOUNT DISK via fstab file 
# /etc/fstab 

# INSTALL NFS-COMMON

SITE="cange"
MOUNT_FOLDER = "CANGE_OPENMRS"

sudo apt-get install nfs-common

# Create mount folder
mkdir -p /mnt/$SITE/synology/$MOUNT_FOLDER

# edit /etc/fstab 
# 10.60.135.5:/volume1/THOMONDE_OPENMRS /mnt/thomonde/synology/THOMONDE_OPENMRS nfs defaults 	0	0

mount -a
