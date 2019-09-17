#!/bin/sh
df -H | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $5 " " $6 }' | while read output;
do
  echo $output
  used=$(echo $output | awk '{ print $1}' | cut -d'%' -f1  )
echo $used
  partition=$(echo $output | awk '{ print $2 }' )
  if [ $used -ge 10 ]; then
    echo "The partition \"$partition\" on $(hostname) has used $used% at $(date)" | mail -s "Disk space alert:  $partition Filesystem $used% used in $(hostname)" yrkt0811@gmail.com
  fi
done
