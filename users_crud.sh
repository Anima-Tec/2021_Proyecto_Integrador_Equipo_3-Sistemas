#!/bin/bash

echo "Bienvenido al gestor de usuarios de 'Che, ¿hoy donamos?'"
echo "1)Agregar usuario         2)Ver usuarios"
echo "3)Modificar un usuario    4)Eliminar un usuario"
echo "S)Salir"

read -p  "Seleccione una opcion: " input

case $input in
  1)
    read -p "Ingrese nombre de usuario (username) " username
    adduser $username
  ;;
  2)
 read -p "a)Listar por nombre b)Listado detallado " in
    case $in in
    a)
    echo "Listando usuarios por nombre..."
    cut -d: -f1 /etc/passwd
    ;;
    b)
    cat /etc/passwd
    ;;
    esac
  ;;
  3) 
    read -p "a)Modificar contraseña     b)Modificar grupo " in
    case $in in
    a)
    read -p "Ingrese el nombre de usuario" username
    passwd $username
    ;;
    b)
    ;;
    esac
  ;;
  S)
  exit
  ;;
esac
