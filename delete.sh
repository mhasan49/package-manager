#!/bin/bash


	whiptail --title "[JUPYTERHUB HPC]" --msgbox " The installer is going to install packages " 8 78
	
	OPTION=$(whiptail --title "[JUPYTERHUB]" --separate-output --checklist "Choose options" 16 55 8 \
  	"1" "Proxy-configurable-http proxy" ON \
  	"2" "Proxy-Nginx" OFF \
  	"3" "Authenticator-LDAP" OFF \
  	"4" "Authenticator-Native Method" OFF \
	"5" "Spawner-Docker" OFF \
	"6" "Spawner-Singularity" OFF \
	"8" "Monitoring" OFF 3>&1 1>&2 2>&3)
	
	

  
   

}
