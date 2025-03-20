#/bin/bash
function esNumero(){
salida=0
while [ $salida -eq 0 ];
do
	read -p "dame un número $1: " numero
	if [ $(echo $numero | egrep -x [0-9]+) -eq $numero 2>/dev/null ];
	then
		salida=1
	fi
done
}
esNumero a
a=$numero
esNumero b
b=$numero
esNumero c
c=$numero
let resultado=$((2 * b + 3 * (a - c) ))
echo "a. 2 * $b + 3 * ($a - $c) = $resultado "
