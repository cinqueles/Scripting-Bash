#!/bin/bash
# Autor: Ismael Morilla
# Version: 1.0
# Descripcion: Administracion de equipos mediante el script

PASSWORD=$(whiptail --passwordbox "Introduce la contraseña" 8 78 --title "Acceso restringido" 3>&1 1>&2 2>&3)
contra="usuario"
if [ "$PASSWORD" == "$contra" ];
then
  OPTION=$(whiptail --title "Menu principal" --menu "Escoge una opción" 15 60 8\
      "1" "Salir"\
      "2" "Usuario"\
      "3" "Grupo"\
      "4" "Manual"\
      "5" "Actualización"\
      "6" "Paquetes"\
      "7" "Procesos ejecutados"\
      "8" "Ficheros" 3>&1 1>&2 2>&3)

      estado=$?

      if [ $estado = 0 ]
  		then
        case $OPTION in
  				1)clear;;
  				2) usuario=$(whiptail --title "Menu principal" --menu "Escoge una opcion" 15 60 4\
  					"1" "Salir"\
  					"2" "Añadir usuario"\
  					"3" "Eliminar usuario"\
  					"4" "Usuarios registrados" 3>&1 1>&2 2>&3)

            usu=$?

           if [ $usu = 0 ]
           then
             case $usuario in
                1) clear;;
                2) add=$(whiptail --inputbox "Nombre del usuario a agregar" 8 78 --title "Agregar usuario" 3>&1 1>&2 2>&3)
                adduser $add
                whiptail --title "Agregar usuario" --infobox "El usuario $add ha sido agregado correctamente" 8 78
                sleep 2
                clear
                 ;;
                3) usue=$(whiptail --inputbox "Nombre del usuario a eliminar" 8 78 --title "Eliminar usuario" 3>&1 1>&2 2>&3)
                  userdel $usue
                  whiptail --title "Eliminar usuario" --infobox "El usuario $usue ha sido eliminado correctamente"
                  sleep 2
                  clear;;
                4) cat /etc/passwd | grep "/bin/bash" | cut -f1 -d":" | tee usuarios.txt 
                whiptail --title "Usuario registrado" textbox usuarios.txt 15 78
                sleep 2
                clear
                ;;
              esac
           fi
           ;;
        esac
      fi
else
  echo "Contraseña erronea"
fi
