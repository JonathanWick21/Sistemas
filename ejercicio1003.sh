#/bin/bash

salida=0
while [ $salida -eq 0 ]
 do
	read -p "Introduce un numero: " numero
	if [ $(echo $numero | egrep -x [0-9]+) -eq $numero 2>/dev/null ];
	then
		salida=1
	fi
done

if [ $numero -eq 2 ]
then
	echo "Es numero par y primo"
else
	if [ $(($numero%2)) -eq 0 ]
	then
		echo "Es un numero par"
	else
		let esPrimo=1
		for ((i=2; i<$numero; i++))
		do
			if (( $numero % i == 0 ))
			then
				esPrimo=0;
				break
			fi
		done
		if [ $esPrimo -eq 1 ]
		then
			echo "Es primo"
		fi
	fi
fi
