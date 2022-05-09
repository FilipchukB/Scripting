#!/bin/bash
exec > system_log.txt
center()
{ 
IFS=""
while read L
do
printf "%b\n" $(printf "%.$((($(tput cols)-${#L})/2))d" 0 | sed 's/0/ /g')$L
done
}

echo -e  $(date)
echo -e "____Команда uname____" | center
uname -a
echo "____Команда ifconfig____" | center
ifconfig
echo "____Команда ip____" | center
ip -br a show
echo "____Статус ufw____" | center
sudo ufw status

echo "____resolv.conf____" | center
cat /etc/resolv.conf >> system_log.txt
echo "____sysctl.conf____" | center
cat /etc/sysctl.conf >> system_log.txt

