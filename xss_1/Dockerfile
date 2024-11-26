FROM ubuntu:latest

# Instalar Apache y PHP
RUN apt-get update && apt-get install -y apache2 php libapache2-mod-php

# Copiar los archivos de la página
COPY index.html /var/www/html/
COPY xss.php /var/www/html/

# Exponer el puerto 80
EXPOSE 80

# Iniciar Apache
CMD ["apachectl", "-D", "FOREGROUND"]
