#!/bin/bash

# Função para gerar a figurinha
gerar_figurinha() {
    local url_imagem="https://i.pinimg.com/564x/b2/69/4c/b2694c550fcf3ab4d398a2157c9a9825.jpg"
    local mensagem="Oi, filho da fruta"
    local diretorio_trabalho="$HOME/storage/downloads"
    local nome_arquivo="figurinha.png"
    local caminho_arquivo="$diretorio_trabalho/$nome_arquivo"

    echo "Baixando imagem..."
    wget -q -O "$caminho_arquivo" "$url_imagem"

    if [ $? -ne 0 ]; then
        echo "Erro ao baixar a imagem. Certifique-se de que a URL da imagem é válida."
        exit 1
    fi

    echo "Adicionando mensagem à imagem..."
    convert "$caminho_arquivo" -gravity South -pointsize 36 -fill white -annotate +0+5 "$mensagem" "$caminho_arquivo"

    echo "Figurinha gerada com sucesso em: $caminho_arquivo"
}

# Função para travar a tela por 10 minutos e impedir o desligamento do dispositivo
travar_tela() {
    echo "Travando a tela do celular por 10 minutos e impedindo o desligamento do dispositivo..."
    termux-wake-lock
    sleep 600 # 10 minutos
    termux-wake-unlock
    echo "Tela do celular travada por 10 minutos. O dispositivo pode ser desligado agora."
}

# Gerar a figurinha
gerar_figurinha

# Travar a tela
travar_tela
