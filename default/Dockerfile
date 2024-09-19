# Usa la imagen oficial de Nginx como base
FROM php:8.1-apache

# Copia el archivo HTML a la carpeta que Nginx usa para servir contenido
COPY index.php /var/www/html/index.php
COPY yoshi.png /var/www/html/yoshi.png

# Expone el puerto 80
EXPOSE 80
