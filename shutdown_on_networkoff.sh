#!/bin/bash
interface=$1 status=$2
case "$status" in
 'down')
  set -e
  sleep 60 
  networkup=`/sbin/ifconfig eth0 | grep 'inet addr:' | wc -l`
  if [ $networkup -eq 1 ]
  then
  echo "network is up"
  else
   echo 'network is down'
   sudo poweroff 
   fi
   ;;
esac

