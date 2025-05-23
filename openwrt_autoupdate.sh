#/usr/bin/env bash
##gstvchacon@gmail.com
##Version 2
##OpenWRT
set -x

function updater {
	opkg update >> $1
}

function message {
	
	time=$(date +%y-%m-%d-T%H:%M:%S)
	yearMonth=$(date +%y%m)
	bar='======================================================='
	cur_log_file="auto_update_$yearMonth.log"
	int="$time: init time for update."
	updating="$time: Updating: "
	none="$time: No updates avalible."
	error="No valid code message."
	case $1 in
		1)
			echo $bar >> $cur_log_file
			echo $int >> $cur_log_file
			updater $cur_log_file
			;;
		2)
			echo $updating $2 >> $cur_log_file
			opkg upgrade $2 >> $cur_log_file
			;;
		3) 	
			echo $none >> $cur_log_file
			;;
		*)
			echo $error
			;;
		esac
}


message 1
updatable=$(opkg list-upgradable|awk '{print $1}')
count=$(echo $updatable | wc -w) 
if [ ! $count -eq 0 ] 
then
	for i in  $updatable
	do
		message 2 $i	
	done; 
else
	message 3
fi
exit
