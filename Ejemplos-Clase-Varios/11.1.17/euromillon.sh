#!/bin/bash
# Autor: Ismael Morilla
# Version: 1.0
# Descripción: Generar combinación del euromillon

let signal=0

while [ $signal -eq 0 ]
do
	let num1=$RANDOM%50+1
	let num2=$RANDOM%50+1
	let num3=$RANDOM%50+1
	let num4=$RANDOM%50+1
	let num5=$RANDOM%50+1
	let est1=$RANDOM%12+1
	let est2=$RANDOM%12+1

	if [ $num1 -lt $num2 ]
	then
	   if [ $num2 -lt $num3 ]
	   then
		if [ $num3 -lt $num4 ]
		then
		   if [ $num4 -lt $num5 ]
		   then
			if [ $est1 -lt $est2 ]
			then
			   let signal=1
			   echo "$num1 $num2 $num3 $num4 $num5 || Estrellas: $est1 $est2"
			fi
		   fi
		fi
	   fi
	fi
done
