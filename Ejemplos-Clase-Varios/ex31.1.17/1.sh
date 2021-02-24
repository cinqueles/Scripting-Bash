#!/bin/bash
# Autor: Ismael Morilla
# Version: 1.0
# Descripcion: cargar los usuarios registrados en el sistema
# y el usuario elegido no se podrá loguear

cat /etc/passwd|cut -f1 -d":">/tmp/usuarios.txt
f1="dialog --menu Usuarios 0 0 0 "
var=""
let i=1
exec</tmp/usuarios.txt
read linea
while [ "$linea" ]
do
	var="$var $linea $i"
	read linea
	let i=$i+1
done

m="$f1 $var"
$m 2>/tmp/matar.txt
matar=$(cat /tmp/matar.txt)
echo "has elegido $matar"
usermod -s /bin/false $matar
exec<&-



