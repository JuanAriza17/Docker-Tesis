# Usar una imagen base de Ubuntu
FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

# Actualizar e instalar las dependencias necesarias
RUN apt-get update && \
    apt-get install -y sudo vim curl \
    openssh-server \
    && apt-get install -y netcat && \
    apt-get clean

RUN mkdir /var/run/sshd

# Crear un nuevo usuario llamado "user" y asignar una contraseña
RUN useradd -m -d /home/user -s /bin/rbash user && echo 'user:password123' | chpasswd && \
    adduser user sudo

# Configurar el archivo sudoers para requerir una contraseña
RUN echo 'user ALL=(ALL) NOPASSWD: /home/user/vuln.sh\n user ALL=(ALL) ALL, !ALL' > /etc/sudoers.d/user && \
    chmod 440 /etc/sudoers.d/user

# Crear una flag que será leída al finalizar el reto
ENV FLAG=${FLAG}

# Crear un archivo vulnerable que requiera escalación de privilegios
RUN echo -e '#!/bin/bash\n# Este es un archivo vulnerable que debe ser explotado\n echo "¡Vulnerabilidad encontrada!"' > /home/user/vuln.sh && \
    chmod +x /home/user/vuln.sh && \
    chmod u+s /home/user/vuln.sh && \
    chown root:root /home/user/vuln.sh

# Modificar el archivo SSH para deshabilitar acceso root y permitir solo el nuevo usuario
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config
RUN echo "AllowUsers user" >> /etc/ssh/sshd_config

# Cambiar a un directorio vulnerable
WORKDIR /home/user

# Exponer el puerto que utilizará el servicio
EXPOSE 1337
EXPOSE 22

# Comando por defecto (un shell bash para interactuar con el sistema)
CMD ["/usr/sbin/sshd", "-D"]
