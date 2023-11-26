#!/bin/bash

# Crear una nueva sesión de Tmux llamada "backo"
tmux new-session -d -s app

# Crear ventanas adicionales
tmux new-window -t app:1
tmux new-window -t app:2
tmux new-window -t app:3

# Cambiar el nombre de las ventanas (opcional)
tmux rename-window -t app:0 "RUNNER_FRONT"
tmux rename-window -t app:1 "RUNNER_BACK"
tmux rename-window -t app:2 "APP"
tmux rename-window -t app:3 "USO_GRAL"

# Ejecutar comandos en cada ventana
tmux send-keys -t app:0 'cd /root/runners/actions-runner-front/; RUNNER_ALLOW_RUNASROOT=1 ./run.sh' C-m
tmux send-keys -t app:1 'cd /root/runners/actions-runner-feel/; RUNNER_ALLOW_RUNASROOT=1 ./run.sh' C-m
tmux send-keys -t app:2 'cd /var/www/html/Arquitectura-de-App; ./RUN_APP.sh' C-m
tmux send-keys -t app:3 'cd' C-m

# Adjuntar la sesión de Tmux
tmux attach-session -t app
