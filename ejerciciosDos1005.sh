#/bin/bash
salida=0

#archivo
puntuaciones=puntuaciones.txt

jugadas=0
dinero=0
read -p "Introduce tu nombre: " nombre


#Vamos a asumir que 0 es cruz
numeroRandom=$(((RANDOM % 2)))
salir=0
while [ $salir -eq 0 ]
do
    while [ $salida -eq 0 ]
    do
        read -p "Cuanto vas a apostar? " apuesta
        if [ $(echo $apuesta | egrep -x [0-9]+) -eq $apuesta 2>/dev/null ]
        then
            salida=1
        else
            echo "Debes introducir un numero entero"
        fi
    done
        if [ $numeroRandom -eq 1 ]
        then
            ganancia=$((apuesta * 2))
            dinero=$((dinero + ganancia))
            echo "Enhorabuena has ganado $((apuesta * 2))"
        
        else
            echo "Has perdido todo borracho"
            dinero=0
        fi

    read -p "Presiona x si quieres salir " decision

    if [ $decision = x ]
    then
        echo "Nos vemos"
        salir=1
    else
        echo "Asi me gusta"
    fi
done

echo "$nombre:$dinero" >> "$puntuaciones"

echo "----Top 5 Jugadores----"
sort -t -k2,2nr "$puntuaciones" | head -n 5 | while IFS=: read -r nombre puntuacion; d

    echo "$nombre: $puntuacion euros"