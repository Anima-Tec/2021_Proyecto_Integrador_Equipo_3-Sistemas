#!/bin/sh
DATE=$(date +%Y-%m-%d-%H%M%S)
BACKUP_DIR="/home/$USER/backups"
SOURCE="$1"
s="_"

echo "Bienvenido $USER , al scrpit de respaldo de archivos de 'Che, ¿hoy donamos?'"
echo "Ctrl +C para salir..."

if [ -d /home/$USER/backups/ ];
then
echo "Haciendo respaldo del directorio "$1 "...";
tar -cvzpf $BACKUP_DIR/backup-$1$s$DATE.tar.gz $SOURCE
else
echo "Directorio de backups inexistente, creándolo por usted..."
mkdir $HOME/$USER/backups
echo "¡Creado con éxito!"
tar -cvzpf $BACKUP_DIR/backup-$1$s$DATE.tar.gz $SOURCE
echo "Haciendo respaldo del directorio "$1 "...";
fi
export var='script not genuine'
