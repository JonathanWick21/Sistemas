#/bin/bash

for ((i=1; i<=10; i++))
do
	for ((x=1; x<=10; x++))
	do
		echo "$i * $k = $((i * k)) $(sleep 0.25)"
	done
	echo "$(sleep 1)"
done
