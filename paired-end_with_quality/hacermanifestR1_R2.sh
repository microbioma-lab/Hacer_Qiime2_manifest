#!/bin/bash

# Directorio de trabajo
directorio="raw_seqs"

# Nombre del archivo de salida (sin extensión)
archivo_salida="MANIFEST"

# Extensión para archivos .gz
extension=".gz"

# Encabezados de las columnas
echo "sample-id,absolute-filepath,direction" > "$archivo_salida.csv"

# Recorre los archivos .gz en el directorio
for archivo in "$directorio"/*"$extension"; do
    # Extraer el sample-id
    sample_id=$(basename "$archivo" | cut -d'_' -f1)
    
    # Determinar la dirección
    if [[ "$archivo" == *R1* ]]; then
        direction="forward"
    elif [[ "$archivo" == *R2* ]]; then
        direction="reverse"
    else
        continue  # Salta archivos que no contienen R1 o R2 en el nombre
    fi
    
    # Obtener la ruta absoluta del archivo
    archivo_absoluto="$(cd "$(dirname "$archivo")" && pwd)/$(basename "$archivo")"

    # Escribir la línea en el archivo CSV
    echo "$sample_id,$archivo_absoluto,$direction" >> "$archivo_salida.csv"
done

echo "MANIFEST creado: $archivo_salida.csv"
