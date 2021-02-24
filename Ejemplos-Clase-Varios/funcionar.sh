#!/bin/bash
# Autor: Ismael Morilla
# Version: 1.0
# Descripcion: Administracion de equipos mediante el script

PASSWORD=$(whiptail --passwordbox "Introduce la contraseña" 8 78 --title "Acceso restringido" 3>&1 1>&2 2>&3)
contra="usuario"
if [ "$PASSWORD" == "$contra" ]
then

	OPTION=$(whiptail --title "Menu principal" --menu "Escoge una opcion" 15 60 4\
		"1" "Salir"\
		"2" "Añadir usuario al sistema"\
		"3" "Añadir grupo al sistema"\
		"4" "Eliminar usuario del sistema"\
		"5" "Eliminar grupo del sistema"\
		"6" "Actualizacion de paquete y repositorios"\
		"7" "Instalacion de paquetes especificos"\
		"8" "Eliminar paquete especifico" 3>&1 1>&2 2>&3)

		estado=$?
			if [ $estado = 0 ]
			then
		case $OPTION in
			 1)clear;;
			 2)USU=$(whiptail --inputbox "Nombre del usuario a agregar" 8 78 --title "Agregar Usuario" 3>&1 1>&2 2>&3)
			   adduser $USU
			   whiptail --title "Agregar Usuario" --infobox "El usuario $USU ha sido agregado correctamente" 8 78;;
			 3)grup=$(whiptail --inputbox "Nombre del grupo a agregar" --title "Agregar Usuario" 3>&1 1>&2 2>&3)
			   groupadd $grup
			   whiptail --title "Agregar Grupo" --infobox "El usuario $grup ha sido agregado correctamente" 8 78;;
			 4)USUE=$(whiptail --inputbox "Nombre del usuario a agregar" 8 78 --title "Agregar Usuario" 3>&1 1>&2 2>&3)
			   userdel $USUE
			   whiptail --title "Eliminar Usuario" --infobox "El usuario $USUE ha sido eliminado correctamente" 8 78;;
			 5)USUE=$(whiptail --inputbox "Nombre del grupo a agregar" 8 78 --title "Eliminar grupo" 3>&1 1>&2 2>&3)
			   groupdel $grupe
			   whiptail --title "Eliminar Grupo" --infobox "El usuario $grupe ha sido eliminado correctamente" 8 78;;
			 6)sudo apt-get update -y
			   sudo apt-get upgrade -y;;
			 7)PAQ=$(whiptail --inputbox "Nombre de paquete a instalar" 8 78 --title "Instalar paquete" 3>&1 1>&2 2>&3)
			   apt-get install $paq;;
  			 8)elim=$(whiptail --inputbox "Nombre del paquete a eliminar" 8 78 --title "Eliminar paquete" 3>&1 1>&2 2>&3)
			   sudo apt-get remove --purge $elim;;
		esac
	 fi
fi
