
fnc_limpiar_logs() {
    # ------------------------------
    # - Control de errores
    # ------------------------------
    CTL_ERROR=0
    CTL_WARNING=0
    # ------------------------------
    DIAS_A_DEJAR=${1}
    if [ -z "$DIAS_A_DEJAR" ]; then
        DIAS_A_DEJAR=${DEFAULT_DIAS_A_DEJAR}
    fi
    flog true "TITULO" "Limpieza de Logs"

    if ! command -v journalctl &> /dev/null; then
        flog true "INFO" "El comando journalctl no está disponible."
    else
        flog true "INFO" "Se van a eliminar logs más antiguos de ${DIAS_A_DEJAR} día(s)..."
        # - Eliminamos logs más antiguos de X días
        sudo journalctl --vacuum-time=${DIAS_A_DEJAR}d
        if [ $? -ne 0 ]; then
            flog true "ERROR" "Error al eliminar logs del journalctl."
            let CTL_ERROR=CTL_ERROR+1
        else
            flog true "OK" "Logs del journalctl eliminados correctamente."
        fi
    fi
    # - Controlamos el flujo con un control de errores
    fnc_control_error $CTL_ERROR $CTL_WARNING "fnc_limpiar_logs"
}