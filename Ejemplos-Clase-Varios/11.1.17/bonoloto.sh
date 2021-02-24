#!/bin/bash
# Autor: Ismael Morilla
# Version: 1.0
# Descripción: generar numeros de la bonoloto

let signal=0

while [ $signal -eq 0 ]
do
	let num1=$RANDOM%49+1
	let num2=$RANDOM%49+1
	let num3=$RANDOM%49+1
	let num4=$RANDOM%49+1
	let num5=$RANDOM%49+1
	let num6=$RANDOM%49+1

  if [ $num1 -lt $num2 ]
  then
     if [ $num2 -lt $num3 ]
     then
        if [ $num3 -lt $num4 ]
    	then
	  if [ $num4 -lt $num5 ]
	  then
	    if [ $num5 -lt $num6 ]
	    then
		let signal=1
		echo "$num1 $num2 $num3 $num4 $num5 $num6"
          fi
	fi
      fi
    fi
  fi

done
