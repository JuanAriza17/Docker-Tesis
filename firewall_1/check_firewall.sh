#!/bin/bash

# Cargar las variables desde el archivo .env
if [ -f "/usr/local/bin/.env" ]; then
    export $(grep -v '^#' /usr/local/bin/.env | xargs)
else
    echo "Error: Archivo .env no encontrado."
    exit 1
fi

# Verifica si la variable FLAG está definida
if [ -z "$FLAG" ]; then
    echo "Error: La flag no está definida en el archivo .env."
    exit 1
fi

# Reglas esperadas del firewall (puedes ajustar las reglas según el reto)
EXPECTED_RULES=(
    "ACCEPT     tcp  --  anywhere             anywhere             tcp dpt:ssh"
    "ACCEPT     tcp  --  anywhere             anywhere             tcp dpt:http"
    "ACCEPT     tcp  --  anywhere             anywhere             tcp dpt:https"
    "ACCEPT     all  --  anywhere             anywhere             state RELATED,ESTABLISHED"
)

# Verifica si todas las reglas están presentes
check_firewall_rules() {
    for rule in "${EXPECTED_RULES[@]}"; do
        if ! iptables -L | grep -q "$rule"; then
            return 1  # Faltan reglas
        fi
    done
    return 0  # Todas las reglas están presentes
}

# Si todas las reglas están presentes, muestra la flag
if check_firewall_rules; then
    echo "FLAG:$FLAG"
else
    echo "Faltan reglas en el firewall. ¡Sigue intentando!"
fi
