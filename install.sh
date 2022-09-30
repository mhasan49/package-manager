#!/bin/bash
{
	aAPT_PREREQS=(

		'whiptail' # G_WHIP
	)
	for i in "${aAPT_PREREQS[@]}"
	do
		dpkg-query -s "$i" &> /dev/null || apt-get -y install "$i" && continue
		echo -e "[FAILED] Unable to install $i, please try to install it manually:\n\t # apt install $i\n"
		exit 1
	done
	unset -v aAPT_PREREQS

	if (( $UID ))
	then
		whiptail --title "[FAILED]" --msgbox " Root privileges required, please run this script with sudo " 8 78
		exit 1
	fi

	whiptail --title "[FAIasdsadLED]" --msgbox " The installer is going to install packages " 8 78
	
	OPTION=$(whiptail --separate-output --checklist "Choose options" 10 35 5 \
  	"1" "install_system" ON \
  	"2" "install_media" OFF \
  	"3" "install_webbrowser" OFF \
  	"4" "install_application" OFF \
	"5" "install_editor" OFF \
	"6" "install_docker" OFF \
	"8" "install_settings" OFF 3>&1 1>&2 2>&3)
	
	if [ -z "$OPTION" ]; then
 	echo " "
	else
	  for _CHOICE in $OPTION; do
	{	declare -i count=25
		export count
		cd $PWD/auto_deploy_ubuntu
    case "$_CHOICE" in
    "1")
	echo 10
	ansible-playbook --tag prog66 master.yml
	
	  ;;
    "2")
    echo $(( $count * 1 ))
	ansible-playbook --tag prog66 master.yml
	
	  ;;
    "3")
    echo $(( $count * 2 ))
	ansible-playbook --tag prog66 master.yml
	  ;;
    "4")
    echo $(( $count * 3 ))
	ansible-playbook --tag prog66 master.yml
	  ;;
	"5")
    echo $(( $count * 4 ))
	ansible-playbook --tag prog66 master.yml
      ;;  
    *)
      echo "Unsupported item $CHOICE!" >&2
      exit 1
      ;;
	  
    esac
	
	
	} | whiptail --gauge "Please wait while we are installing..." 6 50 0
  	done
	fi
	whiptail --title "[OK]" --msgbox " Installation, done! " 8 78
   

  
   

}
