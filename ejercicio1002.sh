#/bin/bash
#Compruebo la hora haciendo una variable con ella
hora=$(date +%H)
#Compruebo si es mañana, tarde o noche
if [[ $hora -ge 7 && $hora -lt 15 ]]
then
	echo "Buenos dias"
elif [[ $hora -ge 14 && $hora -lt 20 ]]
then
	echo "Buenas tardes"
else
	echo "Buenas noches"
fi
