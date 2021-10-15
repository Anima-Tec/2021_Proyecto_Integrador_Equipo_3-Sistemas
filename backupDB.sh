#!/bin/sh
if [ -d /home/$USER/backups/ ];
then
echo "Haciendo respaldo de la base de datos...";
mysqldump -u user -p exampledb > respaldo_exampledb.sql
else
echo "Directorio de backups inexistente, creándolo por usted..."
mkdir $HOME/$USER/backups
echo "¡Creado con éxito!"

echo "Haciendo respaldo de la base de datos...";
fi