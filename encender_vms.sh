#!/bin/bash

# IDs de las máquinas virtuales a encender
vm_ids=(101 102 104)

# Recorre la lista de IDs y enciende las máquinas virtuales
for id in "${vm_ids[@]}"; do
    qm start "$id"
    if [ $? -eq 0 ]; then
        echo "Máquina virtual $id encendida con éxito."
    else
        echo "Error al encender la máquina virtual $id."
    fi
done
