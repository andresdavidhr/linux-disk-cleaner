#!/bin/bash
# --------------------------------------------------------
# Script: start.sh
# Descripción: Script principal de limpieza de disco para Linux
# Autor: Andres David
# Fecha: 2025-07-22
# --------------------------------------------------------
# Este script actúa como punto de entrada principal para ejecutar
# todas las funciones de limpieza de disco disponibles en el sistema.
# --------------------------------------------------------

# Obtener el directorio del script actual
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# --------------------------------------------------------
# CARGA DE CONFIGURACIÓN Y UTILIDADES
# --------------------------------------------------------

# Cargar utilidades
source "${SCRIPT_DIR}/utils/flog.sh"
source "${SCRIPT_DIR}/utils/fnc_control_error.sh"
source "${SCRIPT_DIR}/utils/fnc_check_permisos.sh"
source "${SCRIPT_DIR}/utils/fnc_is_sourced.sh"
source "${SCRIPT_DIR}/utils/fnc_help.sh"
source "${SCRIPT_DIR}/utils/fnc_limpiar_todo.sh"
source "${SCRIPT_DIR}/utils/fnc_df.sh"

# Cargar módulos de limpieza
source "${SCRIPT_DIR}/modules/packages.sh"
source "${SCRIPT_DIR}/modules/snap.sh"
source "${SCRIPT_DIR}/modules/logs.sh"

# Cargar configuración
source "${SCRIPT_DIR}/config/general.sh"
source "${SCRIPT_DIR}/config/opciones.sh"

# --------------------------------------------------------
# PUNTO DE ENTRADA
# --------------------------------------------------------

# Verificar que el script se está ejecutando directamente (no siendo sourced)
if [[ "$(fnc_is_sourced)" -eq 1 ]]; then
    main "$@"
fi
