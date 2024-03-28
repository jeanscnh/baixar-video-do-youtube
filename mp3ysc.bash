#!/bin/bash

# Verifica se o Python está instalado
python3 --version >/dev/null 2>&1
if [ $? -ne 0 ]; then
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
    echo "1. Baixar MP3"
    echo "2. Baixar vídeo em 720p"
    echo "3. Baixar vídeo em 1080p"
    echo "4. Sair"
}

baixar_mp3() {
    clear
    read -p "Digite a URL do vídeo do YouTube: " youtube_url

    # Cria um arquivo temporário em Python para baixar o vídeo do YouTube em MP3
    echo "from pytube import YouTube" > download_youtube.py
    echo "yt = YouTube('$youtube_url')" >> download_youtube.py
    echo "stream = yt.streams.filter(only_audio=True).first()" >> download_youtube.py
    echo "stream.download(output_path=r'$caminho_downloads/YouTubeDownloads')" >> download_youtube.py

    # Executa o script Python para baixar o vídeo
    python3 download_youtube.py

    # Apaga o arquivo temporário Python
    rm download_youtube.py
    read -p "Pressione Enter para continuar..." 
}

baixar_720p() {
    clear
    read -p "Digite a URL do vídeo do YouTube: " youtube_url

    # Executa o script Python para baixar o vídeo em 720p
    python3 -c "from pytube import YouTube; YouTube('$youtube_url').streams.filter(res='720p').first().download(output_path=r'$caminho_downloads/YouTubeDownloads')"
    read -p "Pressione Enter para continuar..." 
}

baixar_1080p() {
    clear
    read -p "Digite a URL do vídeo do YouTube: " youtube_url

    # Executa o script Python para baixar o vídeo em 1080p
    python3 -c "from pytube import YouTube; YouTube('$youtube_url').streams.filter(res='1080p').first().download(output_path=r'$caminho_downloads/YouTubeDownloads')"
    read -p "Pressione Enter para continuar..." 
}

while true; do
    menu
    read -p "Opção: " opcao

    case $opcao in
        1) baixar_mp3 ;;
        2) baixar_720p ;;
        3) baixar_1080p ;;
        4) exit ;;
        *) echo "Opção inválida. Por favor, escolha uma opção válida." ;;
    esac
done
