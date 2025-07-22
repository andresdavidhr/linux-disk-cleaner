
flog() {
    local FECHA ACTIVO TIPO MENSAJE
    FECHA=$(date +'%Y-%m-%d %H:%M:%S')
    ACTIVO=$1
    TIPO="$2"
    shift 2
    MENSAJE="$*"

    : "${VERBOSE:=true}"

    if [[ -z "$FICHERO_LOG" ]]; then
        echo "Error: FICHERO_LOG no está definido." >&2
        return 1
    fi

    if [ "$ACTIVO" = true ]; then
        case "$TIPO" in
            "TITULO")
                {
                    echo
                    echo "------------------------------------------------------"
                    echo " $MENSAJE"
                    echo "------------------------------------------------------"
                } | tee -a "$FICHERO_LOG"
                ;;
            "ROW")
                line="------------------------------------------------------"
                [ "$VERBOSE" = true ] && echo "$line"
                echo "$line" >> "$FICHERO_LOG"
                ;;
            *)
                line="[$FECHA] - $TIPO - $MENSAJE"
                [ "$VERBOSE" = true ] && echo "$line"
                echo "$line" >> "$FICHERO_LOG"
                ;;
        esac
    fi
}
