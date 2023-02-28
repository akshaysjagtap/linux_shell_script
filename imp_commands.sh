# echo without new line
echo -n "Database backup and restore utility"

#change text color
echo -e "\033[94m" # color change
echo "rm -f /tmp/check.txt"
echo -e "\033[0m" # reset color

# extract substring
self=$0
self=${self:2}

# handle signals in shell script
trap func SIGINT
trap func SIGQUIT
trap func SIGTSTP

# remove space from a string
echo $str | sed 's/ //g'

# convert date to specific format
date -d "$dt" "+%Y%m%d%H%M%S"

#check for file exists
if [ -f "/tmp/a.txt" ]; 
then

fi

#check for service enabled
systemctl --quiet is-enabled <service_name>

# pendrive access code
pendrive_list=""
list=$(ls /dev/disk/by-id/usb* 2> /dev/null)
cmd=$?
if [ "$cmd" == "0" ];
then
  for mem in $list
  do
    path=$(readlink -f $mem 2> /dev/null)
    cmd=$?
    if [ "$cmd" == "0" ];
    then
      sudo mount $path /mnt/ 1> /dev/null 2> /dev/null
      cmd=$?

      if [ "$cmd" == "0" ] || [ "$cmd" == "32" ];
      then
        sudo umount $path 1> /dev/null 2> /dev/null
        ccmd=$?
        if [ "$ccmd" == "0" ];
        then
          pd=$(sudo blkid $path -o export | grep -i 'LABEL' | cut -d '=' -f 2 2> /dev/null)
          if [ "$pd" == "" ];
          then
            pd=$(sudo blkid $path -o export | grep -i 'DEVNAME' | cut -d '=' -f 2 2> /dev/null)
          fi
          pendrive_list=$(echo $pendrive_list "$pd")
        fi		
      fi
    fi	
  done
fi

#execute sql in shell script in postgres
sql="select table_name"
sql=$sql"	from information_schema.tables"
sql=$sql"	where table_catalog='$dbname' and table_name ~ '.*_[0-9]{2}_[0-9]{2}_[0-9]{4}_[0-9]{2}_[0-9]{2}_[0-9]{2}$'"
skip_tables=$(psql -c "COPY ($sql) to STDOUT" -U $uname -h $host -p $port -d $dbname 2> /dev/null)

#floating point calculations in shell script
let d=500*1024*1024
tt=$(echo "scale = 10; $all_db_size/$d" | bc)


