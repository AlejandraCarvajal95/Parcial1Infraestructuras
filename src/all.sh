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
INPUT_DIR="public/assets/"
OUTPUT_DIR="public/assets/results/"
TEMP_FILE="image.bin"

# Crear directorio de resultados si no existe
mkdir -p ${OUTPUT_DIR}

# Procesar cada imagen PNG en el directorio de entrada
for INPUT_PNG in ${INPUT_DIR}*.png; do
    # Verificar si hay archivos PNG en el directorio
    if [ -f "$INPUT_PNG" ]; then
        # Extraer el nombre base del archivo (sin la ruta y extensión)
        BASENAME=$(basename "$INPUT_PNG" .png)

        # Convertir de PNG a secuencia de píx