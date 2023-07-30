#!/bin/bash

rsync -avog /home/marrz/RESPALDOS/ marrz@192.168.4.50:/home/marrz/REPLICA_RESPALDO

rsync -avog /home --exclude 'RESPALDOS' marrz@192.168.4.50:/home/marrz/REPLICA_RESPALDO

#find /home/marrz/RESPALDOS/SERVIDORES/BD1/DUMPS 
