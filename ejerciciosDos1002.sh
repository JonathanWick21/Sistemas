#/bin/bash


#La contraseña en este caso
PASS="Micontrasenya"

acertado=0
intentos=3

while [ $intentos -gt 0 ] && [ $acertado -eq 0 ]
do
	read -p "Escribe la contraseña: " contrasenya

	if [ $contrasenya = $PASS ]
	then
		echo "Bienvenido"
		acertado=1
	else
		echo "Contraseña incorrecta"
		intentos=$((intentos-1))
	fi
done
