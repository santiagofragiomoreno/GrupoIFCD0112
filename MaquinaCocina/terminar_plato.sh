#!/bin/bash
# Script en la maquina de Javi (~/terminar_plato.sh)

MENSAJERO="iñaki@10.0.140.31"

read -p "ID o nombre del plato terminado: " plato

echo "Avisando al repartidor..."

ssh $MENSAJERO "wall ¡PEDIDO LISTO! Pasa por cocina para recoger: $plato"

echo " ✅ Mensajero avisado."