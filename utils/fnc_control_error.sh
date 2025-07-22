
# --------------------------------------------------------
# Script: fnc_control_error.sh
# Descripción: Función para controlar errores y cortar el flujo de ejecución
# Autor: Andres David
# Fecha: 2023-10-01
# --------------------------------------------------------
# Tipo de Control:
# - CTL_ERROR: Control de errores. Es bloqueante.
# - CTL_WARNING: Control de advertencias. No es bloqueante.
# - CTL_PROCESO: Funcion o script que se está ejecutando.
# --------------------------------------------------------
# Uso:
# fnc_control_error $CTL_ERROR $CTL_WARNING "<nombre_de_la_función_o_script>"
# --------------------------------------------------------

fnc_control_error(){
    # ------------------------------
    CTL_ERROR=${1}
    CTL_WARNING=${2}
    CTL_PROCESO=${3}
    # ------------------------------
    if [ $CTL_ERROR -ne 0 ]; then
        flog true "ERROR" "Se han producido errores durante la ejecución de: ${CTL_PROCESO}"
        exit 1
    elif [ $CTL_WARNING -ne 0 ]; then
        flog true "WARNING" "Se han producido advertencias durante la ejecución de: ${CTL_PROCESO}"
    else
        flog true "OK" "Ejecución de ${CTL_PROCESO} completada sin errores ni advertencias."
    fi

}
