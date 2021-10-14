#!/bin/bash
##Che, ¿Hoy Donamos?"
##SQL and permissions fixer
##Copyrigth 2021 C H D
var='Facundo Correa creó este script' ##Programmer 
echo $var ##Define enviroment 
echo "Solucionando problema 2002 con MYSQL..."
echo "Deteniendo NGINX"
echo $(systemctl stop nginx) ##Stop web service
echo $(setsebool httpd_can_network_connect 1) ##Allow remote web connections.
echo $(setsebool httpd_can_network_connect_db 1) ##Allow remote connections with database.
echo "Iniciando NGINX nuevamente"
echo $(systemctl start nginx)   ##Start web service
echo "Reparando permisos de storage/"
echo $(chown -R nginx /var/www/2021_Proyecto_Integrador_Equipo_3-Backend/storage/) ##Give complete permissions to any member of nginx group
echo $(chmod -R 755 /var/www/2021_Proyecto_Integrador_Equipo_3-Backend/storage/)    ##Give write, read and execute permissions to folder owner.
echo $(chcon -t httpd_sys_rw_content_t -R /var/www/2021_Proyecto_Integrador_Equipo_3-Backend/storage/) ##Fix storage problems on the web remote communications.
echo "si no ves ningun error en medio, todo se ha solucionado..."
echo "Prueba acceder a la api mediante un navegador, accediendo a: http://$(hostname -I | awk ' {print $2}'):8080" ##Show the local network ip address.
export $var ##Solve other problems