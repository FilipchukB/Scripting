#!/bin/bash
statusServise()
{

read -p "Запустити цю програму? [y/n/another exit button] " select
if [[ "$select" = "y" ]]; then
	`systemctl start $check`
	echo "launching $chek"
elif [[ "$select" = "n" ]]; then
	workCheck
	
else 
	exit
fi

}
workCheck()
{
read -p "Введіть команду: " check
sS=`systemctl status $check | grep -o active`
if [[ "$sS" = "active" ]]; then	
	echo "$check $sS"
else
	echo "no work"
	statusServise $check
fi
}


workCheck

