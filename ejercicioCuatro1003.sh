#!/bin/bash
diccionario="diccionario1.txt"
#Funcion para añadir las palabras, le pregunto en que idioma me la habia pasado y dependiendo del idioma le pide unos idiomas u otros y añade debidamente
anyadir(){
    read -p "¿En que idioma era la palabra (1.Español/2.Ingles/3.Catalan/4.Esukera)? " idioma
    
    if [ $idioma -eq 1 ]; then
        read -p "Cual es su traduccion al Ingles?" ingles
        read -p "Cual es su traduccion al Catalan?" catalan
        read -p "Cual es su traduccion al Euskera?" euskera

        echo "$palabraTraducir:$ingles:$catalan:$esukera:" >> $diccionario

    elif [ $idioma -eq 2 ]; then
        read -p "Cual es su traduccion al Español?" español
        read -p "Cual es su traduccion al Catalan?" catalan
        read -p "Cual es su traduccion al Euskera?" euskera

        echo "$español:$palabraTraducir:$catalan:$esukera:" >> $diccionario
    elif [ $idioma -eq 3 ]; then
        read -p "Cual es su traduccion al Espalol" español
        read -p "Cual es su traduccion al Ingles?" ingles
        read -p "Cual es su traduccion al Euskera?" euskera

        echo "$español:$ingles:$palabraTraducir:$esukera:" >> $diccionario

    elif [ $idioma -eq 4 ]; then
        read -p "Cual es su traduccion al Español" español
        read -p "Cual es su traduccion al Ingles?" ingles
        read -p "Cual es su traduccion al Catalan?" catalan

        echo "$español:$ingles:$catalan:$palabraTraducir:" >> $diccionario
    else
        echo "Debes elegir una opcion correcta"
    fi
}
#Esto no hacia mucha falta
salir=0


while [ $salir -ne 1 ]; do

    read -p "Selecciona un opción (1.Español/2.Ingles/3.Catalan/4.Esukera/5.Salir) " seleccion

    if [ $seleccion -eq 5 ]; then
        salir=1
    #El exit es que si no me pregunta que palabra quiero traducir antes de salir
        exit
    fi

    read -p "¿Que palabra quieres traducir? " palabraTraducir


        if [ $seleccion -eq 2 ]; then
        #Meto la palabra en una variable y dependiendo de el idioma que se quiere traducir coge una fila u otra
            traduccion=$(cat $diccionario | egrep "$palabraTraducir" | cut -d ":" -f2)
            #Si no es null la muestro y si no la pido
            if [ $traduccion ]; then
                echo $traduccion
            else
                read -p "$palabraTraducir no esta en el diccionario. ¿Quieres añadirla(Si)?" respuesta
                if [ $respuesta = "Si" ]; then
                    anyadir
                else
                    echo "XAO"
                    exit
                fi
        fi
        elif [ $seleccion -eq 1 ]; then
            traduccion=$(cat $diccionario | egrep "$palabraTraducir" | cut -d ":" -f1)
            if [ $traduccion ]; then
                echo $traduccion
            else
                read -p "$palabraTraducir no esta en el diccionario. ¿Quieres añadirla?(Si)" respuesta
                if [ $respuesta = "Si" ]; then
                    anyadir
                else
                    echo "XAO"
                    exit
                fi
            fi
        elif [ $seleccion -eq 3 ]; then
            traduccion=$(cat $diccionario | egrep "$palabraTraducir" | cut -d ":" -f3)
            if [ $traduccion ]; then
                echo $traduccion
            else
                read -p "$palabraTraducir no esta en el diccionario. ¿Quieres añadirla?(Si)" respuesta
                if [ $respuesta = "Si" ]; then
                    anyadir
                else
                    echo "XAO"
                    exit
                fi
            fi

        elif [ $seleccion -eq 4 ]; then
            traduccion=$(cat $diccionario | egrep "$palabraTraducir" | cut -d ":" -f4)
            if [ $traduccion ]; then
                echo $traduccion
            else
                read -p "$palabraTraducir no esta en el diccionario. ¿Quieres añadirla?(Si)" respuesta
                if [ $respuesta = "Si" ]; then
                    añadir
                else
                    echo "XAO"
                    exit
                fi
            fi

        else
        echo "Debes elegir del 1 al 5"
    fi
done