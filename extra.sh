#!/bin/bash
{	if (( $UID ))
	then
		whiptail --title "[FAILED]" --msgbox " Root privileges required, please run this script with sudo " 8 78
		exit 1
	fi
	aAPT_PREREQS=(

		'whiptail' 
		'ansible' 
		'git' 
		'curl' 
		'wget' 
		'ansible-core' 
	)
	for i in "${aAPT_PREREQS[@]}"
	do
		dpkg-query -s "$i" &> /dev/null || apt-get -y install "$i" && continue
		echo -e "[FAILED] Unable to install $i, please try to install it manually:\n\t # apt install $i\n"
		exit 1
	done
	unset -v aAPT_PREREQS

	# Set Git owner
	GITOWNER=${GITOWNER:-mhasan49}

	# Select Git branch
	if ! [[ $GITBRANCH =~ ^(master|beta|dev)$ ]]
	then
		aWHIP_BRANCH=(

			'main' ': Stable release branch (recommended)'
			'beta' ': Public beta testing branch'
			'dev' ': Unstable development branch'
		)
		if ! GITBRANCH=$(whiptail --title "$G_PROGRAM_NAME" --menu 'Please select the Git branch the installer should use:' --default-item 'master' --ok-button 'Ok' --cancel-button 'Exit' --backtitle "$G_PROGRAM_NAME" 12 80 3 "${aWHIP_BRANCH[@]}" 3>&1 1>&2 2>&3-)
		then
			echo -e '[ INFO ] Exit selected. Aborting...\n'
			exit 0
		fi
		unset -v aWHIP_BRANCH
	fi
	echo "[ INFO ] Selected Git branch: $GITOWNER/$GITBRANCH"

	# Select Git repository
	if ! curl -sSfL "https://raw.githubusercontent.com/$GITOWNER/ubuntu-setup/$GITBRANCH/install.sh" -o installer
	then			
		echo -e '[FAILED] Unable to download . Aborting...\n'
		exit 1
	fi

	# Download the git folder
  

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
