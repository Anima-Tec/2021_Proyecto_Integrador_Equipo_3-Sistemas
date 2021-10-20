#!/bin/sh

echo "1)Manage users    2)Check system resources"
echo "3)Manage backups  4)Fix SQLSTATE 2002 (until system reboot)"
echo "5)Fix SQLSTATE 2002 (permanent)"
read -p "Select an option: " option
case $option in
1)
./users_crud.sh
;;
2)
glances  --disable-sensors --hide-kernel-threads --disable-network --disable-hddtemp --disable-process --disable-log --disable-docker --disable-raid --disable-mem --disable-swap --tree --fs-free-space --disable-diskio
;;
3)
read -p "Insert folder or file to backup (absolute path): " inputBackupFile
./backups.sh $inputBackupFile
;;
4)
./permissionsSQLSTATE2002.sh
systemctl enable SQLSTATE2002
systemctl start SQLSTATE2002
;;
5)
echo "Trying to install daemon..."
cp SQLSTATE2002.service /etc/systemd/system/SQLSTATE2002.service
echo "Task finished."
;;
*)
./control_center.sh
;;
esac
