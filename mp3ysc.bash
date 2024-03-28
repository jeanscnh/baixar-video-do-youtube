#!/bin/bash

# Verifica se o Python está instalado
if ! command -v python3 &>/dev/null; then
    echo "Python não encontrado. Certifique-se de que o Python está instalado."
    exit 1
fi

# Define o caminho para a pasta "Downloads"
caminho_downloads="$HOME/storage/downloads"

# Cria a pasta "YouTubeDownloads" na pasta "Downloads" se ainda não existir
if [ ! -d "$caminho_downloads/YouTubeDownloads" ]; then
    mkdir -p "$caminho_downloads/YouTubeDownloads"
fi

menu() {
    clear
    echo "Escolha uma opção:"
    echo "1. Baixar vídeo em 720p (MP4)"
    echo "2. Baixar vídeo em 1080p (MP4)"
    echo "3. Sair"
}

baixar_video() {
    clear
    read -p "Digite a URL do vídeo do YouTube: " youtube_url
    local resolucao=$1
    echo "Baixando vídeo em $resolucao..."

    # Executa o script Python para baixar o vídeo na resolução especificada (720p ou 1080p)
    python3 -m pytube "$youtube_url" --output "$caminho_downloads/YouTubeDownloads" --resolution "$resolucao"

    if [ $? -eq 0 ]; then
        echo "Vídeo baixado em $resolucao."
    else
        echo "Falha ao baixar o vídeo em $resolucao."
    fi

    read -p "Pressione Enter para continuar..." 
}

while true; do
    menu
    read -p "Opção: " opcao

    case $opcao in
        1) baixar_video "720p" ;;
        2) baixar_video "1080p" ;;
        3) exit ;;
        *) echo "Opção inválida. Por favor, escolha uma opção válida." ;;
    esac
done
