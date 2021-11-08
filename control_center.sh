#!/bin/sh

echo "1)Manage users    2)Check system resources"
echo "3)Manage backups  4)Fix SQLSTATE 2002"
read -p "Select an option: " option
case $option in
1)
chmod +x users_crud.sh
./users_crud.sh
;;
2)
glances  --disable-sensors --hide-kernel-threads --disable-network --disable-hddtemp --disable-process --disable-log --disable-docker --disable-raid --disable-mem --disable-swap --tree --fs-free-space --disable-diskio
;;
3)
chmod +x backups.sh
read -p "Insert folder or file to backup (absolute path): " inputBackupFile
./backups.sh $inputBackupFile
;;
4)
chmod +x permissionsSQLSTATE2002.sh
./permissionsSQLSTATE2002.sh
systemctl enable SQLSTATE2002
systemctl start SQLSTATE2002
;;
*)
./control_center.sh
;;
esac
