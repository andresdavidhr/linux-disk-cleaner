

fnc_help() {
    cat << EOF
Uso: $0 [OPCIONES]

Script de limpieza de disco para sistemas Linux.

OPCIONES:
    -h, --help              Mostrar esta ayuda
    -a, --all               Ejecutar todas las limpiezas disponibles (por defecto)
    -p, --packages          Limpiar solo paquetes innecesarios
    -s, --snap              Limpiar solo versiones antiguas de snap
    -l, --logs [DÍAS]       Limpiar solo logs (por defecto: 7 días)
    -v, --verbose           Mostrar información detallada
    --dry-run              Mostrar qué se haría sin ejecutar (solo para logs)

EJEMPLOS:
    $0                      # Ejecuta todas las limpiezas
    $0 --all               # Ejecuta todas las limpiezas
    $0 --packages          # Solo limpia paquetes
    $0 --logs 3            # Solo limpia logs de más de 3 días
    $0 -p -s               # Limpia paquetes y snap

EOF
}