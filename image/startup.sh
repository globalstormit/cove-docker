#!/bin/bash

# ANSI color codes in env variables
. ./ansi.sh

echo "${GREEN}"
echo '  /$$$$$$   /$$$$$$  /$$    /$$ /$$$$$$$$'
echo ' /$$__  $$ /$$__  $$| $$   | $$| $$_____/'
echo '| $$  \__/| $$  \ $$| $$   | $$| $$      '
echo '| $$      | $$  | $$|  $$ / $$/| $$$$$   '
echo '| $$      | $$  | $$ \  $$ $$/ | $$__/   '
echo '| $$    $$| $$  | $$  \  $$$/  | $$      '
echo '|  $$$$$$/|  $$$$$$/   \  $/   | $$$$$$$$'
echo ' \______/  \______/     \_/    |________/'                                        
echo "${RED}"
echo
echo 'Cove Data Protection - Linux agent Docker image'
echo "${NOCOLOR}"
echo 'By Luke Williams'
echo
# new approach - if deviceprofile and customeruid are both unset, then start in recovery mode
if [ ! -f /etc/init.d/ProcessController ]; then
    echo First Run - Setting up...
    if [ -z $CUSTOMERUID ] && [ -z $DEVICEPROFILE ]; then
        # Start Recovery mode by default if no environment is set
        filename="mxb.run"
        echo
        echo Defaulting to Recovery Mode
        echo
        echo If this is a brand new installation, please set the CUSTOMERUID and DEVICEPROFILE environment variables and rerun the container.
        echo
        echo Enter the following info as the installer asks for it. Note that it does not use the same nomenclature as the web dashboard.
        echo
        echo "Device name:   ${GREEN}Device Name${NOCOLOR}"
        echo "Password:      ${GREEN}Installation Key${NOCOLOR}"
        echo "Security Code: ${GREEN}Passphrase${NOCOLOR}"
        echo    
    else
        if [ -z $DEVICEPROFILE ] || [ -z $CUSTOMERUID ]; then
            echo ERROR - DEVICEPROFILE and CUSTOMERUID environment variable must be set!
            exit
        fi
        filename="swibm#$CUSTOMERUID#$DEVICEPROFILE#.run"    
    
    fi

    echo downloading Cove...
    
    curl -o $filename https://cdn.cloudbackup.management/maxdownloads/mxb-linux-x86_64.run
    chmod +x $filename
    echo Running Cove installer...
    ./$filename
fi
service ProcessController start >> /dev/null
sh hud.sh
