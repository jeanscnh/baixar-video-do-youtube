#!/bin/bash

# URL da imagem
image_url="https://i.pinimg.com/originals/0d/44/9b/0d449b9b4c17d0e95f0f8b65ed4ba4a1.jpg"

# Diretório de trabalho
work_dir="$HOME/storage/downloads"

# Nome do arquivo
file_name="sticker.png"

# Baixar a imagem
wget -O "$work_dir/$file_name" "$image_url"

# Verificar se a imagem foi baixada com sucesso
if [ $? -ne 0 ]; then
    echo "Erro ao baixar a imagem. Certifique-se de que a URL da imagem é válida."
    exit 1
fi

# Adicionar bordas à imagem
convert "$work_dir/$file_name" -bordercolor white -border 10x10 "$work_dir/$file_name"

# Adicionar texto à imagem
convert "$work_dir/$file_name" -gravity South -pointsize 36 -fill white -annotate +0+5 "Sua mensagem aqui" "$work_dir/$file_name"

echo "Figurinha gerada com sucesso em: $work_dir/$file_name"
