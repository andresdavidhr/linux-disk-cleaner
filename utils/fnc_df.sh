

fnc_df() {
    # Mostrar uso del disco
    flog true "TITULO" "Mostrando uso del disco..."
    flog true "ROW" ""
    flog true "INFO" "$(printf "%-15s %-8s %-8s %-10s %-5s %s" "Dispositivo" "Tamaño" "Usado" "Disponible" "Uso%" "Montaje")"
    flog true "ROW" ""

    # Mostrar el uso del disco a través de flog
    local disk_info
    disk_info=$(df -h | awk 'NR>1 {printf "%-15s %-8s %-8s %-10s %-5s %s\n", $1, $2, $3, $4, $5, $6}')
    flog true "INFO" "$disk_info"
    flog true "INFO" "Uso del disco mostrado correctamente"
}
