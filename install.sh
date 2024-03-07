#!/bin/bash

if (( $UID )); then
    whiptail --title "[ERROR]" --msgbox " Root privileges required, please run this script with sudo " 8 78
    exit 1
fi

if [ -f /etc/os-release ]; then
    . /etc/os-release
    if [ "$ID" != "debian" ] && [ "$ID" != "ubuntu" ]; then
        whiptail --title "[ERROR]" --msgbox " The following script is intended for Debian/Ubuntu systems. " 8 78
        exit 1
    fi
else
    whiptail --title "[ERROR]" --msgbox " Unable to determine the distribution. " 8 78
    exit 1
fi

echo "_____________________________________________________________"
echo "    Installing required packages for the script    "
echo "_____________________________________________________________"

APT_PREREQS=(
    'whiptail'
    'ansible'
    'git'
    'curl'
    'wget'
    'ansible-core'
)

for i in "${APT_PREREQS[@]}"; do
    dpkg-query -s "$i" &> /dev/null || apt-get -y install "$i" && continue
    echo -e "[FAILED] Unable to install $i, please try to install it manually:\n\t # apt install $i\n"
    exit 1
done

unset -v APT_PREREQS

CURRENT_DATE=$(date "+%Y%m%d")
CURRENT_DIR=$(pwd)
SYS_LOG="$CURRENT_DIR/log/system_$CURRENT_DATE.log"
MEDIA_LOG="$CURRENT_DIR/log/media_$CURRENT_DATE.log"
WEB_LOG="$CURRENT_DIR/log/web_$CURRENT_DATE.log"
EDITOR_LOG="$CURRENT_DIR/log/editor_$CURRENT_DATE.log"
SETTINGS_LOG="$CURRENT_DIR/log/settings_$CURRENT_DATE.log"
DOCKER_LOG="$CURRENT_DIR/log/docker_$CURRENT_DATE.log"
APP_LOG="$CURRENT_DIR/log/app_$CURRENT_DATE.log"
RESTORE_LOG="$CURRENT_DIR/log/restore_$CURRENT_DATE.log"
BACKUP_LOG="$CURRENT_DIR/log/backup_$CURRENT_DATE.log"

whiptail --title "[INFO]" --msgbox " The installer is going to install packages " 8 78

OPTION=$(whiptail --separate-output --checklist "Choose options" 15 40 7 \
"1" "install_system" ON \
"2" "install_editors" OFF \
"3" "install_media" OFF \
"4" "install_application" OFF \
"5" "install_browser" OFF \
"6" "backup" OFF \
"7" "restore" OFF 3>&1 1>&2 2>&3)

if [ -z "$OPTION" ]; then
    echo " "
else
    for _CHOICE in $OPTION; do
        {
            declare -i count=25
            export count
            cd $PWD/ubuntu
            case "$_CHOICE" in
            "1")
                echo $(( $count * 0 ))
                ansible-playbook --tag prog10 master.yml  2>&1 | tee -a "$SYS_LOG"
                ;;
            "2")
                echo $(( $count * 1 ))
                ansible-playbook --tag prog20 master.yml 2>&1 | tee -a "$EDITOR_LOG"
                ;;
            "3")
                echo $(( $count * 2 ))
                ansible-playbook --tag prog30 master.yml 2>&1 | tee -a "$MEDIA_LOG"
                ;;
            "4")
                echo $(( $count * 3 ))
                ansible-playbook --tag prog40 master.yml 2>&1 | tee -a "$APP_LOG"
                ;;
            "5")
                echo $(( $count * 4 ))
                ansible-playbook --tag prog50 master.yml 2>&1 | tee -a "$WEB_LOG"
                ;;
            "6")
                echo $(( $count * 4 ))
                ansible-playbook --tag prog60 master.yml 2>&1 | tee -a "$BACKUP_LOG"
                ;;
            "7")
                echo $(( $count * 4 ))
                ansible-playbook --tag prog70 master.yml 2>&1 | tee -a "$RESTORE_LOG"
                ;;
            *)
                echo "Unsupported item $CHOICE!" >&2
                exit 1
                ;;
            esac
        } | whiptail --gauge "Please wait while we are installing..." 6 50 0
    done
fi

whiptail --title "[SUCCESS]" --msgbox " Installation, done! " 8 78
echo "_____________________________________________________________"
echo "                    Done!!                                "
echo "_____________________________________________________________"
