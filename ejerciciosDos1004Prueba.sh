 #/bin/bash
 2
 3 salida=0
 4 saldo=0 
 5 numero=$(((RANDOM %1)+1))
 6 while [ salida -eq 0 ]
 7 do
 8         read -p "Cuanto vas a apostar? " apuesta
 9         if [ $(echo $numero | egrep -x [0-9]+) -eq $numero 2>/dev/null ]
10         then
11                 salida=1
12         else
13                 echo "Debes introducir un numero entero"
14         fi
15 done
16 
17 read -p "¿Cara(0) o cruz(1)?" decision
18         
19         if [ $decision -eq $numero ]
20         then
21                 echo "Has ganado"
