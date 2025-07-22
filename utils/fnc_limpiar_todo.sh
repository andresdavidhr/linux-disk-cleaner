
fnc_limpiar_todo() {
    local dias_logs=${1:-7}

    flog true "TITULO" "Ejecutando limpieza completa del sistema"

    # Ejecutar todas las funciones de limpieza
    fnc_limpiar_paquetes
    fnc_limpiar_snap
    fnc_limpiar_logs "$dias_logs"
    flog true "INFO" "Limpieza completa finalizada."
}
