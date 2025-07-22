
fnc_check_root() {
    # ------------------------------
    # - Control de errores
    # ------------------------------
    CTL_ERROR=0
    CTL_WARNING=0
    # ------------------------------
    # Comprobamos si el usuario es root
    if [ "$(id -u)" -ne 0 ]; then
        flog true "WARNING" "Este script debe ejecutarse como root. No se ejecuta."
        let CTL_ERROR=CTL_ERROR+1
    else
        flog true "INFO" "Ejecutando como root."
    fi
    # - Controlamos el flujo con un control de errores
    fnc_control_error $CTL_ERROR $CTL_WARNING "Comprobación de permisos"
}