#!/usr/bin/env bash
#
# Este script se encarga de invocar los tres programas que permiten la 
# conversion de un PNG a secuencia de pixeles, se procesan esos pixeles y
# posteriormente se convierte esa secuencia de pixeles a un archivo en formato
# PNG
#
# Autor: John Sanabria - john.sanabria@correounivalle.edu.co
# Fecha: 2024-08-22
#

# Directorios de entrada y salida
INPUT_DIR="/workspaces/Parcial1Infraestructuras/public/assets/"
OUTPUT_DIR="/workspaces/Parcial1Infraestructuras/public/results/"
TEMP_FILE="image.bin"

# Crear el directorio de salida si no existe
mkdir -p "$OUTPUT_DIR"

# Procesar cada archivo PNG en el directorio de entrada
for INPUT_PNG in "${INPUT_DIR}"*.png; do
    # Verificar si hay archivos PNG en el directorio
    if [ ! -e "$INPUT_PNG" ]; then
        echo "No se encontraron archivos PNG en $INPUT_DIR"
        exit 1
    fi

    echo "Procesando: ${INPUT_PNG}"

    TEMP_FILE="${INPUT_PNG%.png}.bin"

    python3 fromPNG2Bin.py ${INPUT_PNG}
    ./main ${TEMP_FILE}                      
    python3 fromBin2PNG.py ${TEMP_FILE}.new

    echo "Procesado y guardado: ${INPUT_PNG}"
done