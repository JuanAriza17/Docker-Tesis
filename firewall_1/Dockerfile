FROM ubuntu:20.04

# Instalar iptables y OpenSSH server
RUN apt-get update && \
    apt-get install -y iptables openssh-server

# Crear el directorio para los archivos del SSH
RUN mkdir /var/run/sshd

# Permitir el acceso root a SSH (opcional, puedes usar otro usuario si prefieres)
RUN echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config

# Agregar una contraseña para el root (cambiar 'rootpassword' por lo que prefieras)
RUN echo 'root:rootpassword' | chpasswd

# Copiar el script de verificación de firewall
COPY check_firewall.sh /usr/local/bin/check_firewall.sh
RUN chmod +x /usr/local/bin/check_firewall.sh

RUN iptables -A INPUT -p tcp --dport 22 -j ACCEPT  # SSH permitido

EXPOSE 22
# Ejecutar SSH y el script de verificación de firewall
CMD ["/usr/sbin/sshd", "-D"]

