#!/data/data/com.termux/files/usr/bin/bash

# Verifica se o Python está instalado
if ! command -v python3 &> /dev/null; then
    echo "Python não encontrado. Instale o Python usando 'pkg install python'."
    exit 1
fi

# Define o caminho para a pasta "Downloads"
caminho_downloads=$HOME/storage/downloads

# Cria a pasta "YouTubeDownloads" na pasta "Downloads" se ainda não existir
mkdir -p "$caminho_downloads/YouTubeDownloads"

menu() {
    clear
    echo "Escolha uma opção:"
    echo "1. Baixar MP3"
    echo "2. Baixar vídeo em 720p"
    echo "3. Baixar vídeo em 1080p"
    echo "4. Sair"
}

baixar_mp3() {
    read -p "Digite a URL do vídeo do YouTube: " youtube_url

    # Executa o script Python para baixar o vídeo em MP3
    python3 -c "from pytube import YouTube; yt = YouTube('$youtube_url'); stream = yt.streams.filter(only_audio=True).first(); stream.download(output_path='$caminho_downloads/YouTubeDownloads')"
}

baixar_720p() {
    read -p "Digite a URL do vídeo do YouTube: " youtube_url

    # Executa o script Python para baixar o vídeo em 720p
    python3 -c "from pytube import YouTube; YouTube('$youtube_url').streams.filter(res='720p').first().download(output_path='$caminho_downloads/YouTubeDownloads')"
}

baixar_1080p() {
    read -p "Digite a URL do vídeo do YouTube: " youtube_url

    # Executa o script Python para baixar o vídeo em 1080p
    python3 -c "from pytube import YouTube; YouTube('$youtube_url').streams.filter(res='1080p').first().download(output_path='$caminho_downloads/YouTubeDownloads')"
}

while true; do
    menu

    read -p "Opção: " opcao

    case $opcao in
        1) baixar_mp3 ;;
        2) baixar_720p ;;
        3) baixar_1080p ;;
        4) exit ;;
        *) echo "Opção inválida. Tente novamente." ;;
    esac
done
