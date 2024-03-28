#!/bin/bash

# Verifica se o Python está instalado
if ! command -v python3 &>/dev/null; then
    echo "Python não encontrado. Certifique-se de que o Python está instalado."
    exit 1
fi

# Verifica se o módulo 'youtube-dl' está instalado
if ! python3 -c "import youtube_dl" &>/dev/null; then
    echo "O módulo 'youtube_dl' não está instalado. Por favor, instale-o com 'pip install youtube-dl'."
    exit 1
fi

# Define o diretório de downloads
caminho_downloads="$HOME/storage/downloads"

# Cria o diretório de downloads se não existir
mkdir -p "$caminho_downloads"

# Função para baixar o vídeo do YouTube
baixar_video_youtube() {
    clear
    read -p "Digite a URL do vídeo do YouTube: " youtube_url

    echo "Baixando o vídeo do YouTube..."

    # Executa o youtube-dl para baixar o vídeo
    youtube-dl -o "$caminho_downloads/%(title)s.%(ext)s" "$youtube_url"

    echo "Download concluído. O vídeo foi salvo em: $caminho_downloads"
    read -p "Pressione Enter para continuar..."
}

# Menu de opções
menu() {
    clear
    echo "App Termux - Baixar Vídeos do YouTube"
    echo "--------------------------------------"
    echo "1. Baixar Vídeo do YouTube"
    echo "2. Sair"
}

# Loop principal
while true; do
    menu
    read -p "Selecione uma opção: " opcao

    case $opcao in
        1) baixar_video_youtube ;;
        2) exit ;;
        *) echo "Opção inválida. Por favor, escolha uma opção válida." ;;
    esac
done
