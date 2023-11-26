#!/bin/bash

# Crear una nueva sesión de Tmux llamada "backo"
tmux new-session -d -s backo

# Crear ventanas adicionales
tmux new-window -t backo:1
tmux new-window -t backo:2
tmux new-window -t backo:3

# Cambiar el nombre de las ventanas (opcional)
tmux rename-window -t backo:0 "RUNNER_FRONT"
tmux rename-window -t backo:1 "RUNNER_BACK"
tmux rename-window -t backo:2 "BACKOFFICE_APP"
tmux rename-window -t backo:3 "USO_GRAL"

# Ejecutar comandos en cada ventana
tmux send-keys -t backo:0 'cd /root/runners/actions-runner-frontend/; RUNNER_ALLOW_RUNASROOT=1 ./run.sh' C-m
tmux send-keys -t backo:1 'cd /root/runners/actions-runner-backend/; RUNNER_ALLOW_RUNASROOT=1 ./run.sh' C-m
tmux send-keys -t backo:2 'cd /var/www/html/Arquitectura-de-Backoffice; ./RUN_BACKO.sh' C-m
tmux send-keys -t backo:3 'cd' C-m

# Adjuntar la sesión de Tmux
tmux attach-session -t backo
