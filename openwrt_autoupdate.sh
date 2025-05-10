#/usr/bin/env bash

time=$(date +%y-%m-%dT%H:%M:%S)
dates=$(date +%y-%m-%d)
echo '=======================================================' >>auto_update_log.log
echo 'init time for update: '$time >>auto_update_log.log
opkg update >>auto_update_log.log 2>&1

for i in $(opkg list-upgradable|awk '{print $1}') 
do
	echo $time $i>>auto_update_log.log
	opkg upgrade $i >>auto_update_log.log 2>&1	
done; 
time=$(date +%y-%m-%dT%H:%M:%S)
echo 'end time :' $time>>auto_update_log.log
echo '=======================================================' >>auto_update_log.log