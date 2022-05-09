#!/bin/bash
echo "Скрип для перевірки статусу програми"
read -p "Введіть команду: " check
if [[ `systemctl status $check | grep -o active` = "active" ]]; then
	echo "working $check "
else
	echo "not working or incorrect name $check"
fi
