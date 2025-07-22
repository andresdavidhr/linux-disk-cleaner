
# --------------------------------------------------------
# FUNCIÓN PRINCIPAL
# --------------------------------------------------------

main() {
    # Variables de configuración
    local ejecutar_paquetes=false
    local ejecutar_snap=false
    local ejecutar_logs=false
    local ejecutar_todo=false
    local dias_logs=7

    # Procesar argumentos de línea de comandos
    while [[ $# -gt 0 ]]; do
        case $1 in
            -h|--help)
                fnc_help
                exit 0
                ;;
            -a|--all)
                ejecutar_todo=true
                shift
                ;;
            -p|--packages)
                ejecutar_paquetes=true
                shift
                ;;
            -s|--snap)
                ejecutar_snap=true
                shift
                ;;
            -l|--logs)
                ejecutar_logs=true
                if [[ $2 =~ ^[0-9]+$ ]]; then
                    dias_logs=$2
                    shift 2
                else
                    shift
                fi
                ;;
            -v|--verbose)
                verbose=true
                shift
                ;;
            --dry-run)
                dry_run=true
                shift
                ;;
            *)
                flog true "ERROR" "Opción desconocida: $1"
                fnc_help
                exit 1
                ;;
        esac
    done

    # Si no se especifica ninguna opción, ejecutar todo
    if [[ "$ejecutar_paquetes" == false && "$ejecutar_snap" == false && "$ejecutar_logs" == false ]]; then
        ejecutar_todo=true
    fi

    # Verificar permisos de root
    fnc_check_root

    # Mostrar banner inicial
    mostrar_banner
    fnc_df

    # Ejecutar limpiezas según las opciones seleccionadas
    if [[ "$ejecutar_todo" == true ]]; then
        fnc_limpiar_todo "$dias_logs"
    else
        if [[ "$ejecutar_paquetes" == true ]]; then
            fnc_limpiar_paquetes
        fi

        if [[ "$ejecutar_snap" == true ]]; then
            fnc_limpiar_snap
        fi

        if [[ "$ejecutar_logs" == true ]]; then
            if [[ "$dry_run" == true ]]; then
                flog true "INFO" "[DRY RUN] Se eliminarían logs más antiguos de ${dias_logs} día(s)"
                journalctl --disk-usage
            else
                fnc_limpiar_logs "$dias_logs"
            fi
        fi
    fi

    # Mostrar resumen final
    fnc_df

    flog true "INFO" "Script de limpieza finalizado exitosamente."
}