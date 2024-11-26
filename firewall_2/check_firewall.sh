#!/bin/bash

if [ -f "/usr/local/bin/.env" ]; then
    export $(grep -v '^#' /usr/local/bin/.env | xargs)
else
    echo "Error: Archivo .env no encontrado."
    exit 1
fi

if [ -z "$FLAG" ]; then
    echo "Error: La flag no está definida en el archivo .env."
    exit 1
fi

# Reglas esperadas del firewall
EXPECTED_RULES=(
    "ACCEPT     tcp  --  192.168.0.0/16       anywhere             tcp dpt:ssh"
    "DROP       all  --  203.0.113.0/24       anywhere"
    "ACCEPT     tcp  --  anywhere             215.0.113.5          tcp dpt:https"
    "DROP       tcp  --  anywhere             anywhere             tcp dpt:ftp"
)

# Verificar las reglas presentes
check_firewall_rules() {
    for rule in "${EXPECTED_RULES[@]}"; do
        if ! iptables -L | grep -q "$rule"; then
            return 1
        fi
    done

    # Verificar si existen reglas innecesarias
    UNNECESSARY_RULES=(
        "ACCEPT     tcp  --  anywhere             anywhere             tcp dpt:ftp"
        "ACCEPT     all  --  anywhere             anywhere"
    )
    for rule in "${UNNECESSARY_RULES[@]}"; do
        if iptables -L | grep -q "$rule"; then
            return 1
        fi
    done

    return 0
}

if check_firewall_rules; then
    echo "FLAG:$FLAG"
else
    echo "El firewall no cumple con las políticas de seguridad. ¡Corrígelo y vuelve a intentarlo!"
fi

