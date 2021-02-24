#!/bin/bash
# Autor: Ismael Morilla
# Version: 1.0
# Descripcion: menu con todos los usuarios que tengan carpeta /home,
#al usuario elegido se le creará una pagina web por defecto.
#crear una carpeta /home/public_html aqui se publicará
#la pagina web automaticamente. si no tiene el apache2 instalado, instalarlo
#cargar el mozilla y que se vea la pagina web(http://localhost~/usuario) del usuario.
#la pagina web por defecto se llamara index.html

cat /etc/passwd | cut -f1,6 -d: | grep "/home/" | cut -f1 -d: >/tmp/usuario.txt
f1="dialog --menu Usuarios 0 0 0 "
var=""
let i=1

exec</tmp/usuarios.txt
read linea
	while [ "$linea" ]
	do
		var="$var $linea $i "
		read linea
		let i=$i+1
	done
m="$f1 $var"
$m 2>/tmp/elegido.txt
elegido=$(cat /tmp/elegido.txt)
echo "has elegido $elegido"

rut="/home/$elegido/public_html"
if [ -e $rut ]
then
	echo "Ya tiene la carpeta $rut creada"
else
	mkdir $rut
	chown $elegido:$elegido /home/$elegido/public_html
fi
servicio=/etc/init.d/apache2
if [ -e $servicio ]
then
	clear
else
	apt-get install apache2
	a2enmod userdir
	service apache2 restart
fi

a="/home/$elegido/public_html/index.html"
echo "<html>" > $a
echo "<body>" >> $a
echo "<h1> Esta es la pagina de $elegido</h1>" >> $a
echo "<img src='http://www.oit.uci.edu/wp-content/uploads/Octocat.png'>" >> $a
echo "</body>" >> $a
echo "</html>" >> $a
firefox http://localhost/~$elegido/index.html&
clear



