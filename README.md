# Linux Disk Cleaner

Script automatizado para la limpieza de disco en sistemas Linux.
Realiza múltiples tareas de mantenimiento para liberar espacio en disco de manera segura y eficiente.

## Características

- **Limpieza de paquetes**: Elimina paquetes innecesarios usando `apt autoremove` y `apt clean`
- **Limpieza de Snap**: Elimina versiones antiguas de paquetes snap instalados
- **Limpieza de logs**: Elimina logs del sistema antiguos usando `journalctl`
- **Verificación de permisos**: Comprueba que se ejecute con permisos de root
- **Logging detallado**: Registra todas las operaciones en `log/linux-disk-cleaner.log`
- **Control de errores**: Manejo robusto de errores con logging automático
- **Arquitectura modular**: Fácil extensión con nuevos módulos de limpieza
- **Interfaz de línea de comandos**: Opciones flexibles para uso selectivo

## Uso

### Ejecución simple (limpieza completa)
```bash
sudo ./start.sh
```

### Opciones disponibles
```bash
# Mostrar ayuda
./start.sh --help

# Ejecutar todas las limpiezas (comportamiento por defecto)
sudo ./start.sh --all

# Ejecutar solo limpieza de paquetes
sudo ./start.sh --packages

# Ejecutar solo limpieza de snap
sudo ./start.sh --snap

# Ejecutar solo limpieza de logs (por defecto 7 días)
sudo ./start.sh --logs

# Limpiar logs de más de 3 días
sudo ./start.sh --logs 3

# Combinaciones de módulos
sudo ./start.sh --packages --snap

# Modo simulación para logs
sudo ./start.sh --logs --dry-run

# Modo verbose
sudo ./start.sh --verbose
```

## Estructura del proyecto

```
linux-disk-cleaner/
├── start.sh                    # Script principal de entrada
├── log/                        # Feedback de las ejecuciones
├── config/
│   ├── general.sh              # Configuración general (rutas de log, variables por defecto, etc.)
│   └── opciones.sh             # Función main() y manejo de argumentos
├── modules/
│   ├── packages.sh             # Módulo de limpieza de paquetes
│   ├── snap.sh                 # Módulo de limpieza de snap
│   └── logs.sh                 # Módulo de limpieza de logs del sistema
└── utils/
    ├── flog.sh                 # Función de logging
    ├── fnc_control_error.sh    # Control de errores
    ├── fnc_check_permisos.sh   # Verificación de permisos
    ├── fnc_is_sourced.sh       # Verificación ejecución sourced
    ├── fnc_help.sh             # Sistema de ayuda
    ├── fnc_banner.sh           # Pinta cabezera de la aplicación
    ├── fnc_df.sh               # Pinta la información de las filesystem
    └── fnc_limpiar_todo.sh     # Función que contiene todas las funciones de limpieza para simplificar la llamada
```

## Requisitos

- Sistema Linux con gestor de paquetes `apt`
- Permisos de root o sudo
- Paquetes: `snap` (opcional, solo si se quiere limpiar snap)
- `systemd` con `journalctl` para limpieza de logs

## Logging

Todas las operaciones se registran en `log/linux-disk-cleaner.log` con información detallada:
- Marcas de tiempo
- Tipo de operación (INFO, WARNING, ERROR, OK, TITULO, ROW)
- Mensajes descriptivos de cada acción
- Banner informativo del proceso
- Resumen de espacio en disco antes y después

## Seguridad

- El script requiere permisos de root para funcionar
- Verifica la disponibilidad de herramientas antes de usarlas
- No elimina archivos críticos del sistema
- Cada módulo implementa su propio control de errores
- Modo dry-run disponible para operaciones de logs

## Estado del desarrollo

### Módulos implementados:
- ✅ Limpieza de paquetes APT
- ✅ Limpieza de versiones antiguas de Snap
- ✅ Limpieza de logs del sistema (journalctl)
- ✅ Sistema de logging completo
- ✅ Control de errores robusto
- ✅ Verificación de permisos
- ✅ Función principal `main()` con manejo de argumentos
- ✅ Sistema de ayuda interactiva
- ✅ Modo dry-run para logs
- ✅ Verificación de ejecución sourced
- ✅ Banner y resúmenes de espacio en disco

### Funcionalidades adicionales disponibles:
- ✅ Modo verbose
- ✅ Combinación de módulos selectivos
- ✅ Configuración flexible de días para logs
- ✅ Control de errores y warnings diferenciado
- ✅ Logging con categorías (TITULO, ROW, INFO, etc.)

## Contribuir

Para añadir nuevos módulos de limpieza:
1. Crear el archivo en `modules/` siguiendo el patrón `nombre_modulo.sh`
2. Definir la función con el patrón `fnc_limpiar_<nombre>`
3. Implementar control de errores usando las utilidades proporcionadas:
   ```bash
   CTL_ERROR=0
   CTL_WARNING=0
   # ... lógica del módulo ...
   fnc_control_error $CTL_ERROR $CTL_WARNING "fnc_<nombre>"
   ```
4. Añadir el source del módulo en `start.sh`
5. Añadir la opción correspondiente en la función `main()` en `config/opciones.sh`

## Ejemplo de uso completo

```bash
# Hacer el script ejecutable
chmod +x start.sh

# Limpieza completa con banner y resumen
sudo ./start.sh

# Limpieza selectiva de paquetes y snap
sudo ./start.sh --packages --snap

# Limpiar logs de más de 1 día en modo simulación
sudo ./start.sh --logs 1 --dry-run

# Ver ayuda completa
./start.sh --help
```

## Salida típica del script

El script proporciona:
- Banner de inicio con título del proyecto
- Resumen inicial del espacio en disco
- Logs detallados de cada operación
- Manejo de errores y warnings
- Resumen final del espacio liberado

## Autor

Andres David - 2025