#!/bin/bash
# Autor: Ismael Morilla
# Version: 1.0
# Descripcion: con radiolist mostrar los shell
# bash, sh, tcsh, ash y ere shell sera el nuevo shell del usuario

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
shell=$(zenity  --list  --text "Is linux.byexamples.com helpful?" \
--radiolist  --column "Pick" --column "Opinion" \
FALSE bash  \
FALSE sh \
FALSE tcsh \
FALSE ash)

echo $shell 
usermod -s /bin/$shell $matar
exec<&-



