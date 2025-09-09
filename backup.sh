#!/bin/bash

# Cargar configuración
source ../config/backup.conf

# Fecha y hora
fecha=$(date +%d%m%y)
hora=$(date +%H_%M)
logfile="/var/log/backup_${fecha}_${hora}.log"

# Comprimir directorios
tar -czf "$DIR_DESTINO/backup_${fecha}.tar.gz" "$DIRECTORIOS"

# Comprobar resultado
if [ $? -eq 0 ]; then
    # Notificar vía mail local
    echo "Se ha realizado el backup de $DIRECTORIOS" | mailx -s "Backup Diario $fecha" "$USER"
    
    # Guardar log y mostrar por pantalla
    echo "Backup realizado correctamente el $fecha a las $hora" | tee -a "$logfile"
else
    # Guardar log de error
    echo "Backup incorrecto, revise backup.conf" | tee -a "$logfile"
fi
