# Usar una imagen base de Ubuntu
FROM ubuntu:20.04

# Actualizar los paquetes y luego instalar OpenSSH Server y iptables
RUN apt-get update && apt-get install -y openssh-server iptables sudo

# Crear el directorio necesario para SSH
RUN mkdir /var/run/sshd

# Crear un nuevo usuario llamado "firewalluser" y asignar una contraseña
RUN useradd -m -d /home/firewalluser -s /bin/bash firewalluser && echo 'firewalluser:password123' | chpasswd

# Crear un grupo para administrar iptables
RUN groupadd firewall

# Agregar el nuevo usuario al grupo "firewall"
RUN usermod -aG firewall firewalluser

# Dar permisos específicos para iptables mediante sudoers
RUN echo "firewalluser ALL=(ALL) NOPASSWD: /sbin/iptables" >> /etc/sudoers

# Deshabilitar permisos sudo para otros comandos
RUN echo "Defaults:firewalluser !requiretty" >> /etc/sudoers
RUN echo "Defaults:firewalluser env_reset" >> /etc/sudoers

# Modificar el archivo SSH para deshabilitar acceso root y permitir solo el nuevo usuario
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config
RUN echo "AllowUsers firewalluser" >> /etc/ssh/sshd_config

# Copiar el script de verificación de firewall
COPY check_firewall.sh /usr/local/bin/check_firewall.sh
RUN chmod +x /usr/local/bin/check_firewall.sh

# Exponer el puerto 22 para SSH
EXPOSE 22

# Comando para iniciar el servidor SSH
CMD ["/usr/sbin/sshd", "-D"]
