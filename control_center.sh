#!/bin/bash
echo "1)Administrar usuarios    2)Comprobar recursos del sistema"
echo "3)Administrar backups"
read -p "Seleccione una opcion" option
case $option in
1)
./users_crud.sh
;;
2)
echo $(glance)
;;
3)
read -p "Ingrese el directorio o archivo a respaldar (ruta absoluta): " inputBackupFile
./backups.sh $inputBackupFile
;;
esac
