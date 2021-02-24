#!/bin/bash
# Autor: Ismael Morilla
# Version: 1.0
# Descripción: Serie fibonacci de los 200 primeros numeros

let num1=0
let num2=1
let cont=1
let nuevo=0

echo "$num1 $num2"
while [ $cont -lt 92 ]
do
	let nuevo=$num1+$num2
	let num1=$num2
	let num2=$nuevo
	echo "$cont --> $nuevo"
	let cont=$cont+1
done
