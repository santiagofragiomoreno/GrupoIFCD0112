#!/bin/bash

# ============================================================
# SCRIPT: procesarpedido.sh (SERVIDOR RESTAURANTE - SANTI)
# ============================================================

# 1. CONFIGURACIÓN DE RUTAS E IPs
LOG_LOCAL="/home/santiagofragio/sync_curso/sfm_poo/GrupoIFCD0112/MaquinaCliente/pedidos.log"
IP_COCINA="10.0.140.33"
USER_COCINA="javier"

# 2. CAPTURA DE DATOS (Argumentos enviados por Kevin)
PLATO=$1
BEBIDA=$2
HORA=$(date "+%H:%M:%S")

# 3. REGISTRO EN TU LOG (Para que tú lo veas con tail -f)
{
  echo "------------------------------------------"
  echo "PEDIDO RECIBIDO A LAS $HORA"
  echo "CLIENTE: Kevin"
  echo "PLATO:   $PLATO"
  echo "BEBIDA:  $BEBIDA"
  echo "------------------------------------------"
} >> "$LOG_LOCAL"

# 4. ENVÍO A LA COCINA (MAQUINA DE JAVI)
# Enviamos el pedido al "Monitor de Cocina" de Javi
ssh "$USER_COCINA@$IP_COCINA" "echo '[$HORA] 👨‍🍳 COMANDA: $PLATO con $BEBIDA' >> /home/javier/PycharmProjects/GrupoIFCD0112/MaquinaCocina/pedidos_cocina.log"

# 5. CONFIRMACIÓN PARA EL CLIENTE (Esto aparecerá en la pantalla de Kevin)
echo "✅ Santi: Pedido recibido correctamente. ¡Javi ya tiene los fogones encendidos!"
