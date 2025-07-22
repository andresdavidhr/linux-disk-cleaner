
fnc_is_sourced() {
    # Si $0 es igual a bash, entonces fue 'sourced'
    [[ "${BASH_SOURCE[0]}" != "${0}" ]] && echo 1 || echo 0
}