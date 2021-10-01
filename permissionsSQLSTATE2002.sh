echo "Solucionando problema 2002 con MYSQL..."
echo "Deteniendo NGINX"
echo $(systemctl stop nginx)
echo $(setsebool httpd_can_network_connect 1)
echo $(setsebool httpd_can_network_connect_db 1)
echo "Iniciando NGINX nuevamente"
echo $(systemctl start nginx)
echo "Reparando permisos de storage/"
echo $(chown -R nginx /var/www/2021_Proyecto_Integrador_Equipo_3-Backend/storage/)
echo $(chmod -R 755 /var/www/2021_Proyecto_Integrador_Equipo_3-Backend/storage/)
echo $(chcon -t httpd_sys_rw_content_t -R /var/www/2021_Proyecto_Integrador_Equipo_3-Backend/storage/)
echo "si no ves ningun error en medio, todo se ha solucionado..."
echo "Prueba acceder a la api mediante un navegador, accediendo a: http://$(hostname -I | awk ' {print $2}'):8080"