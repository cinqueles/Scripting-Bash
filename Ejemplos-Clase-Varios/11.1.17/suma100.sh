#!/bin/bash
# Autor: Ismael Morilla
# Version: 1.0
# Descripción: Suma de los 100 primeros numeros
let suma=0
let num=0
while [ $num -lt 100 ]
do
	echo "$num"
	let num=$num+1
	let suma=$suma+$num
done

echo "La suma es $suma"
