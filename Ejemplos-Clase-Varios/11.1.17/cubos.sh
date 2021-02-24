#!/bin/bash
# Autor: Ismael Morilla
# Version: 1.0
# Descripción: Suma de los 20 primeros cubos

let num=0
let cont=0
let suma=0

while [ $cont -le 20 ]
do
	let resultado=$num*$num*$num
	echo "$cont --> $resultado"
	let suma=$suma+$resultado
	let cont=$cont+1
	let num=$num+1
done
echo "El resultado de la suma es $suma"
