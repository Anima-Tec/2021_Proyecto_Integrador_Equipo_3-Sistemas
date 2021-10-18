#!/bin/sh

echo "1)Administrar usuarios    2)Comprobar recursos del sistema"
echo "3)Administrar backups     4)Solucionar error SQLSTATE 2002"
read -p "Seleccione una opcion" option
case $option in
1)
./users_crud.sh
;;
2)
echo $(glances)
;;
3)
read -p "Ingrese el directorio o archivo a respaldar (ruta absoluta): " inputBackupFile
./backups.sh $inputBackupFile
;;
4)
./permissionsSQLSTATE2002.sh
;;
*)
./control_center.sh
;;
esac
