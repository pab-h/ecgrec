#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
LINKS_FILE="$SCRIPT_DIR/code15-links.txt"
DATA_DIR="$SCRIPT_DIR/../data/CODE15"

while read -r url; do

    filename=$(basename "${url%%\?*}")

    echo "Baixando $filename para $DATA_DIR..."
    
    wget "$url" -O "$DATA_DIR/$filename" || { echo "Erro ao baixar $filename"; continue; }
    unzip "$DATA_DIR/$filename" -d "$DATA_DIR" || { echo "Erro ao descompactar $filename"; continue; }
    rm "$DATA_DIR/$filename"


done < "$LINKS_FILE"
