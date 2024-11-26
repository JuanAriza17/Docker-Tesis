#!/bin/bash

sudo iptables -A INPUT -p tcp --dport ssh -j ACCEPT 
sudo iptables -A INPUT -j ACCEPT 

# Iniciar el servidor SSH en primer plano
/usr/sbin/sshd -D