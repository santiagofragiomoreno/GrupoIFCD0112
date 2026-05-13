#!/bin/bash

# Configuración de IPs y Usuarios
CLIENTE="kevin@10.0.140.26"
COCINA="javier@10.0.140.33"

# Colores para que sea más visual
VERDE='\033[0;32m'
AZUL='\033[0;34m'
NC='\033[0m' # No Color

clear
echo -e "${AZUL}=========================================="
echo "    CENTRAL DE PEDIDOS - CASA SANTI       "
echo -e "==========================================${NC}"

# 1. EL CLIENTE PIDE
echo -e "[Restaurante] Conectando con la mesa de Kevin..."

# Capturamos el pedido. El 'ssh -t' es CRUCIAL para que Kevin pueda escribir.
pedido=$(ssh -t $CLIENTE "
    clear
    echo '--- BIENVENIDO A CASA SANTI ---'
    echo '¿Qué plato desea degustar hoy?'
    read plato
    echo '¿Y para acompañar (bebida)?'
    read bebida
    echo \"\$plato con \$bebida\"
")

echo -e "${VERDE}[OK] Pedido recibido: $pedido${NC}"

# 2. LA COCINA RECIBE Y PREPARA
echo -e "[Restaurante] Enviando comanda a Javi (Cocina)..."

ssh $COCINA "
    echo '------------------------------------------'
    echo '👨‍🍳 JAVI: ¡Oído cocina!'
    echo 'Marchando: $pedido'
    echo '------------------------------------------'
    echo 'Cocinando...'
    sleep 7
    echo '✅ COMIDA LISTA. ¡Que pase el mensajero!'
"

# 3. EL FINAL DEL PROCESO
echo -e "${AZUL}=========================================="
echo "    PROCESO DE PEDIDO COMPLETADO          "
echo -e "==========================================${NC}"
