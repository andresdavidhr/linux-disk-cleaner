
fnc_limpiar_apt() {
    # ------------------------------
    # - Control de errores
    # ------------------------------
    CTL_ERROR=0
    CTL_WARNING=0
    # ------------------------------
    flog true "INFO" "Limpiando paquetes APT..."
    # Actualizamos la lista de paquetes
    sudo apt update
    # Limpiamos paquetes innecesarios
    sudo apt autoremove --purge -y
    sudo apt clean
    flog true "INFO" "Paquetes APT limpiados."
    # - Controlamos el flujo con un control de errores
    fnc_control_error $CTL_ERROR $CTL_WARNING "fnc_limpiar_apt"
}


fnc_limpiar_paquetes() {
    # ------------------------------
    # - Control de errores
    # ------------------------------
    CTL_ERROR=0
    CTL_WARNING=0
    # ------------------------------
    flog true "INFO" "Iniciando limpieza de paquetes..."

    # Comprobamos si apt está instalado
    if ! command -v apt &> /dev/null; then
        flog true "INFO" "El gestor de paquetes APT no está instalado."
    else
        flog true "INFO" "El gestor de paquetes APT está instalado."
        fnc_limpiar_apt
    fi

    flog true "INFO" "Limpieza de paquetes completada."

    # - Controlamos el flujo con un control de errores
    fnc_control_error $CTL_ERROR $CTL_WARNING "fnc_limpiar_paquetes"
}
