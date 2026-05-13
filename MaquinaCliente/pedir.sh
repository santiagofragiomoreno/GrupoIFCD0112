#!/bin/bash

RESTAURANTE="santiagofragio@10.0.140.40"

clear
echo "Conectando con el restaurante para ver la carta..."
sleep 1

# 1. Kevin pide la carta de tu máquina y la muestra en SU pantalla
ssh $RESTAURANTE "cat /home/santiagofragio/sync_curso/sfm_poo/GrupoIFCD0112/MaquinaRestaurante/carta.txt"

# 2. Kevin elige
echo ""
read -p "Santi te escucha, ¿qué vas a tomar? " plato
read -p "¿Y de beber? " bebida

# 3. Kevin envía el pedido a tu script central
echo "Enviando pedido..."
ssh $RESTAURANTE "/home/santiagofragio/sync_curso/sfm_poo/GrupoIFCD0112/MaquinaRestaurante/procesarpedido.sh '$plato' '$bebida'"
