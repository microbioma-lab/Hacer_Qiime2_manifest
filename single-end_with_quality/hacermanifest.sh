#!/bin/bash

# Cambia al directorio "raw_seqs"
cd raw_seqs

MANIFEST="MANIFEST"

# Extensión para archivos .gz
extension=".gz"

# Encabezado de la tabla
echo "sample-id,filename,direction" > "$MANIFEST"

# Iterar a través de los archivos en el directorio
for archivo in *"$extension"; do
  # Extraer el nombre del archivo sin la extensión
  nombre_sin_extension="${archivo%.*}"
  
  # Extraer la primera parte del nombre (hasta el primer "_")
  sample="${nombre_sin_extension%%_*}"
  
  # Imprimir la fila de la tabla
  echo "$sample,$archivo,forward" >> "$MANIFEST"
done

echo "El archivo MANIFEST se ha creado en el directorio actual: $(pwd)/$MANIFEST"