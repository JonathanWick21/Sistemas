#/bin/bash


#Generar numero random
numeroRandom=$(((RANDOM %10)+1))

acertado=0

while [ $acertado -eq 0 ]
do
	salida=0

	while [ $salida -eq 0 ];
	do
		read -p "dame un número: " numero
		if [ $(echo $numero | egrep -x [0-9]+) -eq $numero 2>/dev/null ];
		then
			salida=1
		fi
	done
	if [ $numero -eq $numeroRandom ]
	then
		acertado=1
	else
		echo "Has fallado tonto"
	fi
done
echo "¡HAS ACERTADO!"
