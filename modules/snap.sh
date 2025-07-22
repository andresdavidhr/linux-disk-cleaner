
fnc_limpiar_snap() {
    # ------------------------------
    # - Control de errores
    # ------------------------------
    CTL_ERROR=0
    CTL_WARNING=0
    # ------------------------------
    # - Comprobamos si snap está instalado
    flog true "TITULO" "Limpieza de Snap"
    if ! command -v snap &> /dev/null; then
        flog true "INFO" "Snap no está instalado."
    else
        flog true "INFO" "Eliminando versiones antiguas de snaps..."
        sudo bash -c "snap list --all | awk '/disabled/{print \$1, \$3}' | while read snapname revision; do snap remove \"\$snapname\" --revision=\"\$revision\"; done"
        if [ $? -ne 0 ]; then
            let CTL_ERROR=CTL_ERROR+1
            flog true "ERROR" "Error al eliminar versiones antiguas de snaps."
        else
            flog true "OK" "Versiones antiguas de snaps eliminadas correctamente."
        fi
    fi
    # - Controlamos el flujo con un control de errores
    fnc_control_error $CTL_ERROR $CTL_WARNING "fnc_limpiar_snap"
}
