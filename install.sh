#!/bin/bash
{
	#------------------------------------------------------------------------------------------------
	# Install jupyterhub on any Debian system
	#------------------------------------------------------------------------------------------------
	# REQUIREMENTS
	# - Currently running Debian Buster or above, ideally minimal, e.g. Raspberry Pi OS Lite-ish =))
	# - systemd as system/init/service manager
	# - Either Ethernet connection or local (non-SSH) terminal access
	#------------------------------------------------------------------------------------------------
	# Dev notes:
	# Following items must be exported or assigned to DietPi scripts, if used, until dietpi-obtain_hw_model is executed:
	# - G_HW_MODEL
	# - G_HW_ARCH
	# - G_DISTRO
	# - G_DISTRO_NAME
	# - G_RASPBIAN
	#
	# The following environment variables can be set to automate this script (adjust example values to your needs):
	# - GITOWNER='MichaIng'			(optional, defaults to 'MichaIng')
	# - GITBRANCH='master'			(must be one of 'master', 'beta' or 'dev')
	# - IMAGE_CREATOR='Mr. Tux'
	# - PREIMAGE_INFO='Some GNU/Linux'
	# - HW_MODEL=0				(must match one of the supported IDs below)
	# - WIFI_REQUIRED=0			[01]
	# - DISTRO_TARGET=6			[67] (Bullseye: 6, Bookworm: 7)
	#------------------------------------------------------------------------------------------------

	# Core globals
	G_PROGRAM_NAME='DietPi-Installer'




{
	
	if ! [[ $GITBRANCH =~ ^(master|beta|dev)$ ]]
	then
		aWHIP_BRANCH=(

			'master' ': Stable release branch (recommended)'
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
	
}
}
