# Script de Backup de Directorios

Este repositorio contiene un script en Bash para realizar backups de directorios especificados en un archivo de configuración, registrar logs y enviar notificaciones por correo local.

---

## Contenido

- `backup.sh` → Script principal de backup.
- `config/backup.conf` → Archivo de configuración con las rutas y usuario de correo.

---

## Requisitos

Para que el script funcione correctamente:


1. **mailx** instalado para enviar notificaciones locales:
2. **sendmail** instalado y activo

```bash
sudo dnf install mailx
sudo systemctl enable --now sendmail
