#!/bin/bash
exec > sys_info_proc.txt
center()
{ 
IFS=""
while read L
do
printf "%b\n" $(printf "%.$((($(tput cols)-${#L})/2))d" 0 | sed 's/0/ /g')$L
done
}

echo "Час роботи" | center
uptime 
echo "Поточні користувачі" | center
w
echo "Останні логіни" | center
last -10
echo "ТОП-10 процесів за використанням ОЗУ/ЦП" | center
top | head
echo "TCP/Udp" | center
sudo netstat -tulpn
echo "Віртуальний простір" | center
free -m | grep Своп.
echo "Дисковий простір" | center
df -h
