# Usa una imagen base de PHP con Apache
FROM php:7.4-apache

# Instala extensiones de PHP necesarias
RUN docker-php-ext-install mysqli

# Copia el código fuente al contenedor
COPY src/ /var/www/html/

# Exponer el puerto 80
EXPOSE 80
