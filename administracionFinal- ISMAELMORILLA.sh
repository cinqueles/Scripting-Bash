#!/bin/bash
#Autor: Ismael Morilla
#Script para la administración de equipos remotos

read -p "¿Se va a realizar para un rango de equipos (1) o para un solo equipo (2)?: " equipo

case $equipo in
	1) read -p "Deme la dirección IP: " dirip;;
	2) totalEquipos=`cat /var/lib/misc/dnsmasq.leases | wc -l`
	   echo "Hay un total de $totalEquipos equipos";;
	*) echo "Opción no válida";;
esac
passremota="usuario"

echo "###########################################"
echo "# administración de equipos remotos       #"
echo "###########################################"
echo " 1.- Usuarios y grupos"
echo " 2.- Actualizaciones e instalaciones de programas"
echo " 3.- Copia de seguridad"
read -p "Elija una opcion: " opcion

case $opcion in
1) 
        echo "#######################################"
	echo "Usuarios y grupos"
	echo "#######################################"
	echo " 1 crear grupos"
	echo " 2 borrar grupos"
	echo " 3 crear usuarios"
	echo " 4 borrar usuarios"
	echo "#######################################"
	read -p "Elija una opcion: " opcionUsuarios
	case $opcionUsuarios in
		1) if [ $equipo -eq 1 ]
		   then
			read -p "¿Cuantos grupos desea crear?: " cantidadgrupos
			cuentag=1
			while [ $cantidadgrupos -ge $cuentag ]
			do
				read -p "Deme el nombre del grupo para $dirip: " nomgru
				conectividad=`ping -c 1 $dirip`
				if [ $? -eq 0 ]
				then
					sshpass -p $passremota ssh root@$dirip groupadd $nomgru
				fi
				cuentag=$(($cuentag+1))
			done
		   else

			contequipo=1

			if [ -e grupos.txt ]
			then
				rm grupos.txt
			fi

			read -p "¿Cuantos grupos desea crear?: " cantidadgrupos

			cuentag=1
			while [ $cantidadgrupos -ge $cuentag ]
			do
				read -p "Deme el nombre del grupo numero $cuentag: " nomgru
				echo $nomgru >> grupos.txt
				cuentag=$(($cuentag+1))
			done

			while [ $contequipo -le $totalEquipos ]
			do
				ip=`cat /var/lib/misc/dnsmasq.leases | head -$contequipo | tail -1 | cut -d" " -f3`
				numerogrupos=`cat grupos.txt | wc -l`

				contadorgrupos=1

				while [ $contadorgrupos -le $numerogrupos ]
				do
					nombregrupo=`cat grupos.txt | head -$contadorgrupos | tail -1`

					conectividad=`ping -c 1 $ip`
					if [ $? -eq 0 ]
					then
						echo "					"
						echo "   Creando el grupo $nombregrupo..."
						echo "					"
						sshpass -p $passremota ssh root@$ip groupadd $nombregrupo
					fi
					contadorgrupos=$(($contadorgrupos+1))
				done
				contequipo=$(($contequipo+1))
			done
			fi;;
		2)  if [ $equipo -eq 1 ]
		    then
			  read -p "¿Cuantos grupos desea borrar?: " cantidadgrupos
			  cuentag=1

			  while [ $cantidadgrupos -ge $cuentag ]
			  do
				read -p "Deme el nombre del grupo en $dirip: " nomgru
				conectividad=`ping -c 1 $dirip`
				if [ $? -eq 0 ]
				then
					sshpass -p $passremota ssh root@$dirip groupdel $nomgru
				fi
				cuentag=$(($cuentag+1))
			  done
		else 
		contequipos=1
			if [ -e grupos.txt ]
			then
				rm grupos.txt
			fi

		read -p "¿Cuantos grupos desea borrar?: " cantidadgrupos
		cuentag=1
			while [ $cantidadgrupos -ge $cuentag ]
			do
				read -p "Deme el nombre del grupo numero $cuentag: " nomgru
				echo $nomgru >> grupos.txt
				cuentag=$(($cuentag+1))
			done

			while [ $contequipos -le $totalEquipos ]
			do
				ip=`cat /var/lib/misc/dnsmasq.leases | head -$contequipos | tail -1 | cut -d" " -f3`
				numerogrupos=`cat grupos.txt | wc -l`
				contadorgrupos=1

				while [ $contadorgrupos -le $numerogrupos ]
				do
					nombregrupo=`cat grupos.txt | head -$contadorgrupos | tail -1`

					conectividad=`ping -c 1 $ip`
					if [ $? -eq 0 ]
					then
						echo "Borrando el grupo $nombregrupo en la máquina $ip"
						sshpass -p $passremota ssh root@$ip groupdel $nombregrupo
					fi
					contadorgrupos=$(($contadogrupos+1))
				done
				contequipos=$(($contequipos+1))
			done
		fi;;
	3) if [ $equipo -eq 1 ]
	   then
		read -p "¿Cuantos usuarios desea crear?: " cantidadusuarios
		read -p "Deme el nombre del grupo del usuario: " nomgrupo
		sshpass -p $passremota ssh root@$dirip groupadd $nomgrupo

		cuentau=1
		while [ $cantidadusuarios -ge $cuentau ]
		do
			read -p "Deme el nombre del usuario numero $cuentau: " nomusu

			conectividad=`ping -c 1 $dirip`
			if [ $? -eq 0 ]
			then
				echo "                            "
				echo "Creando usuario..."
				sshpass -p $passremota ssh root@$dirip useradd -g $nomgrupo -d /home/$nombreusu -m -s /bin/bash $nomusu
				echo "                           "
				echo "Añada una contraseña..."
				sshpass -p $passremota ssh root@$dirip passwd $nomusu
			fi
			cuentau=$(($cuentau+1))
		done
	else 
		if [ -e usuarios.txt ]
		then
			rm usuarios.txt
		fi

		contequipos=1
		read -p "¿Cuantos usuarios quiere crear?: " cantidadusuarios

		cuentau=1
		while [ $cantidadusuarios -ge $cuentau ]
		do
			read -p "Deme el nombre del usuario numero $cuentau: " nomusu
			echo $nomusu >> usuarios.txt
			cuentau=$(($cuentau+1))
		done

		read -p "Deme el nombre nombre del grupo de los usuarios: " grupousuarios
		sshpass -p $passremota ssh root@$ip groupadd $grupousuarios
		while [ $contequipos -le $totalEquipos ]
		do
			ip=`cat /var/lib/misc/dnsmasq.leases | head -$contequipos | tail -1 | cut -d" " -f3`
			numerousuarios=`cat usuarios.txt | wc -l`
			contadorusuarios=1

			while [ $contadorusuarios -le $numerousuarios ]
			do
				nombreusuario=`cat usuarios.txt | head -$contadorusuarios | tail -1`

				conectividad=`ping -c 1 $ip`
				if [ $? -eq 0 ]
				then
					echo "                                 "
					echo " Creando el usuario $nombreusuario para la ip $ip" 
					echo "                                 "
					sshpass -p $passremota ssh root@$ip useradd -g $grupousuarios -d /home/$nombreusuario -m -s /bin/bash $nombreusuario
					echo "                                  "
					echo " Añada una contraseña"
					echo "                      "
					sshpass -p $passremota ssh root@$ip passwd $nombreusuario
				fi
				contadorusuarios=$(($contadorusuarios+1))
			done
			contequipos=$(($contequipos+1))
		done
		fi;;
	4) if [ $equipo -eq 1 ]
	   then
		read -p "Cuantos usuarios quiere borrar?: " borrar
		cuentab=1
		while [ $borrar -ge $cuentab ]
		do
			read -p "Digame el nombre del usuario a borrar: " nombreborrar
			echo "                        "
			echo "Borrando..."
			echo "             "

			sshpass -p $passremota ssh root@$dirip userdel -r $nombreborrar
			cuentab=$(($cuentab+1))
		done
		echo "Operación terminada"
	else 
	  cuentaborra=1

	  if [ -e borrarusuarios.txt ]
	    then 
		 rm borrarusuarios.txt
	  fi

		read -p "¿Cuantos usuarios quieres borrar?: " cantidadborrar
		contadorborrar=1

		while [ $cantidadborrar -ge $contadorborrar ]
		do
			read -p "Deme el nombre del usuario a borrar: " usuborrar
			echo $usuborrar >> borrarusuarios.txt
			contadorborrar=$(($contadorborrar+1))
		done

		while [ $cuentaborra -le $totalEquipos ]
		do
			ip=`cat /var/lib/misc/dnsmasq.leases | head -$cuentaborra | tail -1 | cut -d" " -f3`
			numeroborrar=`cat borrarusuarios.txt | wc -l`
			cuenta=1

			while [ $cuenta -le $numeroborrar ]
			do
				nombreusuario=`cat borrarusuarios.txt | head -$cuenta | tail -1`

				conectividad=`ping -c 1 $ip`
				if [ $? -eq 0 ]
				then
					echo "                                 "
					echo "Borrando el usuario $nombreusuario de la máquina $ip"
					echo "                        "

					sshpass -p $passremota ssh root@$ip userdel -r $nombreusuario

					echo "Usuario borrado"
				fi
				cuenta=$(($cuenta+1))
			done
			cuentaborra=$(($cuentaborra+1))
		done
	fi;;
	*) echo "opción no valida";;
esac;;
2) echo "#########################################"
   echo " Actualización e instalaciones"
   echo "#########################################"
   echo "1.-Actualizar"
   echo "2.-Instalar"
   echo "                                         "
   read -p "Escoja una opción: " op

   case $op in
	1) if [ $equipo -eq 1 ]
		then
			echo "Actualizando..."
			sleep 2
			sshpass -p $passremota ssh root@$dirip sshpass -p $passremota apt-get update
			sshpass -p $passremota ssh root@$dirip sshpass -p $passremota apt-get upgrade -y
			echo "Actualizado"
		else
			cuentactualiza=1
			while [ $cuentactualiza -le $totalEquipos ]
			do
				ip=`cat /var/lib/misc/dnsmasq.leases | head -$cuentactualiza | tail -1 | cut -d" " -f3`

				echo "Actualizando..."
				sleep 3
				sshpass -p $passremota ssh root@$ip sshpass -p $passremota apt-get update
				sshpass -p $passremota ssh root@$ip sshpass -p $passremota apt-get upgrade -y

				cuentactualiza=$(($cuentactualiza+1))
			done
			echo "Actualizado"
	fi;;
	2) if [ $equipo -eq 1 ]
		then
			read -p "¿Que paquete quiere instalar?: " programa
			echo "Instalando $programa..."
			sleep 2
			sshpass -p $passremota ssh root@$dirip sshpass -p $passremota apt-get install $programa -y
			echo "Instalado"
		else
			cuentainstala=1
			read -p "¿Que paquete quiere instalar?: " programa
			while [ $cuentainstala -le $totalEquipos ]
			do
				ip=`cat /var/lib/misc/dnsmasq.leases | head -$cuentainstala | tail -1 | cut -d" " -f3`
				echo "                                 "
				echo "Instalando $programa..."
				echo "                                "
				sleep 2
				sshpass -p $passremota ssh root@$ip sshpass -p $passremota apt-get install $programa -y

				cuentainstala=$(($cuentainstala+1))
			done
			echo "Instalado"
	fi;;

esac;;
3) if [ $equipo -eq 1 ]
then
	conectividad=`ping -c 1 $dirip`
	if [ $? -eq 0 ]
	then
		nombre="CS-$dirip"

		echo "###################################"
		echo "                                   "
		echo "   Comenzando copia de seguridad   "
		echo "                                   "
		echo "###################################"
		sleep 2
		sshpass -p $passremota ssh root@$dirip tar cvfz $nombre.tar.gz /home

		echo "############################################"
		echo " 		                                  "
		echo "   Moviendose $nombre.tar.gz a su equipo... "
		echo "          	                          "
		echo "############################################"
		sshpass -p $passremota scp root@$dirip:$nombre.tar.gz /home/usuario
		sshpass -p $passremota ssh root@$dirip rm $nombre.tar.gz
		echo "                                          "
		echo " Copia $nombre.tar.gz terminada           "
		echo "                                          "
	   fi
else 
		echo "                                         "
		echo "Hay un total de $totalEquipos equipos"
		echo "                                          "
		contadorequipos=1

		while [ $contadorequipos -le $totalEquipos ]
		do
			ip=`cat /var/lib/misc/dnsmasq.leases | head -$contadorequipos | tail -1 | cut -d" " -f3`

			nombre="CS-$ip"
			conectividad=`ping -c 1 $ip`
			if [ $? -eq 0 ]
			then
				echo "###################################"
				echo "                                   "
				echo "Creando copia de seguridad $nombre"
				echo "                                   "
				echo "###################################"

				sshpass -p $passremota ssh root@$ip tar cvfz $nombre.tar.gz /home

				echo "                                     "
				echo "Moviendo $nombre.tar.gz a su equipo..."
				echo "                                     "

				sshpass -p $passremota scp root@$ip:$nombre.tar.gz /home/usuario
				sshpass -p $passremota ssh root@$ip rm $nombre.tar.gz

			fi
			contadorequipos=$(($contadorequipos+1))
		done

fi;;
esac

