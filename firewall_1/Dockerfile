# Usar una imagen base de Ubuntu
FROM ubuntu:20.04

# Actualizar los paquetes y luego instalar OpenSSH Server, iptables y sudo
RUN apt-get update && apt-get install -y openssh-server iptables sudo

# Crear el directorio necesario para SSH
RUN mkdir /var/run/sshd

# Crear un nuevo usuario llamado "firewalluser" y asignar una contraseña
RUN useradd -m -d /home/firewalluser -s /bin/rbash firewalluser && echo 'firewalluser:password123' | chpasswd

# Configurar permisos limitados para firewalluser en sudoers
RUN echo "firewalluser ALL=(ALL) NOPASSWD: /sbin/iptables, /usr/local/bin/check_firewall.sh" > /etc/sudoers.d/firewalluser
RUN chmod 440 /etc/sudoers.d/firewalluser

# Copiar el script de verificación de firewall
COPY check_firewall.sh /usr/local/bin/check_firewall.sh

# Cambiar el propietario del archivo al usuario firewalluser y establecer permisos
RUN chown firewalluser:firewalluser /usr/local/bin/check_firewall.sh && chmod 111 /usr/local/bin/check_firewall.sh

# Cambiar la shell predeterminada del usuario para restringir comandos
RUN chsh -s /bin/rbash firewalluser

# Bloquear acceso a comandos no necesarios (opcional pero recomendado)
RUN ln -s /bin/false /home/firewalluser/iptables && \
    ln -s /bin/false /home/firewalluser/bash && \
    ln -s /bin/false /home/firewalluser/sh

# Modificar el archivo SSH para deshabilitar acceso root y permitir solo el nuevo usuario
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config
RUN echo "AllowUsers firewalluser" >> /etc/ssh/sshd_config

# Exponer el puerto 22 para SSH
EXPOSE 22

# Comando para iniciar el servidor SSH
CMD ["/usr/sbin/sshd", "-D"]

