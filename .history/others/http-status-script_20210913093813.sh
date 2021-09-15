#!/bin/bash
# Get http code from url...


#Variables
url="https://192.168.1.202:443"
http_code=`wget --spider -S ""$url"" 2>&1 | grep "HTTP/" | awk '{print $2}' | grep 200`

#Tester si le code http est eqal a 200

if [ $http_code=="200" ]
then
   echo "http_status_code: $http_code (OK)"
   #execute script here...
   exit 0
else
   echo "http_status_code: $http_code (fail)"
   exit 0
fi
