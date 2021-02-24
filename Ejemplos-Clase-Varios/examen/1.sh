#!/bin/bash
# Autor: Ismael Morilla
# Version: 1.0
# Descripcion: suma de los multiplos de 5 desde 1 a 10000

let num=0
let suma=0
let resto=0
while [ $num -le 10000 ]
do
	let resto=$num%5
	if [ $resto -eq 0 ]
	then
		let suma=$suma+$num
		echo "$suma"
	fi
	let num=$num+1
done

echo "--------------------------------"
echo "El resultado de la suma es $suma"
echo "--------------------------------"
