#!/bin/bash

# Verifica se o Python está instalado
if ! command -v python3 &>/dev/null; then
    echo "Python não encontrado. Certifique-se de que o Python está instalado."
    exit 1
fi

# Verifica se o módulo 'pytube' está instalado
if ! python3 -c "import pytube" &>/dev/null; then
    echo "O módulo 'pytube' não está instalado. Por favor, instale-o com 'pip install pytube'."
    exit 1
fi

# Define o caminho para a pasta "Downloads"
caminho_downloads="$HOME/storage/downloads"

# Cria a pasta "YouTubeDownloads" na pasta "Downloads" se ainda não existir
if [ ! -d "$caminho_downloads/YouTubeDownloads" ]; then
    mkdir -p "$caminho_downloads/YouTubeDownloads"
fi

baixar_audio_mp4() {
    clear
    read -p "Digite a URL do vídeo do YouTube: " youtube_url

    echo "Baixando áudio do vídeo..."

    # Executa o script Python para baixar o áudio do vídeo em formato MP4
    python3 -m pytube "$youtube_url" --output "$caminho_downloads/YouTubeDownloads" --only-audio --format mp4

    if [ $? -eq 0 ]; then
        echo "Áudio do vídeo baixado com sucesso."
    else
        echo "Falha ao baixar o áudio do vídeo."
    fi

    read -p "Pressione Enter para continuar..." 
}

while true; do
    clear
    echo "Baixar Áudio MP4 do YouTube"
    echo "--------------------------"
    baixar_audio_mp4
done
