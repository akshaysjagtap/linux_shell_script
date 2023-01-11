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
