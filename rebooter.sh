#!/usr/bin/env bash
# This script is used to reboot the router with a call.
# It will called by the openwrt_autoupdate.sh script.
#set -x


function message {
    timer=$(date +%y-%m-%d-T%H:%M:%S)
    if $1
    then
        msg="$timer: receive reboot without argument "
        set_return=1 
    else
        msg="$timer: reboot from : $2"
        et_return=0
    fi
    echo $msg>>rebooter.log
    return $set_return
}


if [ $# -eq 0 ]
then
    message true
else
    message false $1
    echo "##reboot##"
fi
exit