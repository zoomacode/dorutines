#!/usr/bin/env bash

UN=$1
PUB_KEY_FILE=$2
PUB_KEY=`cat $PUB_KEY_FILE`
s="sudo -u $UN"
 
adduser $UN
gpasswd -a $UN sudo

$s mkdir /home/$UN/.ssh
$s chmod 700 /home/$UN/.ssh
$s echo "$PUB_KEY" > /home/$UN/.ssh/authorized_keys
chmod 600 /home/$UN/.ssh/authorized_keys
chown $UN /home/$UN/.ssh/authorized_keys 

echo "Please don'n forget set 'PermitRootLogin yes' in /etc/ssh/sshd_config"
echo "And maybe 'Port XXXX'"
echo "And run command: service ssh restart"
 
