# Usa la imagen oficial de Nginx como base
FROM nginx:alpine

# Copia el archivo HTML a la carpeta que Nginx usa para servir contenido
COPY index.html /usr/share/nginx/html/index.html
COPY yoshi.png /usr/share/nginx/html/yoshi.png

# Expone el puerto 80
EXPOSE 80
