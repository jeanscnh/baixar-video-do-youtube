@echo off

rem Verifica se o Python está instalado
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo Python não encontrado. Certifique-se de que o Python está instalado e configurado no PATH.
    exit /b
)

rem Define o caminho para a pasta "Downloads"
set "caminho_downloads=%USERPROFILE%\Downloads"

rem Cria a pasta "YouTubeDownloads" na pasta "Downloads" se ainda não existir
if not exist "%caminho_downloads%\YouTubeDownloads" mkdir "%caminho_downloads%\YouTubeDownloads"

:menu
cls
echo Escolha uma opção:
echo 1. Baixar MP3
echo 2. Baixar vídeo em 720p
echo 3. Baixar vídeo em 1080p
echo 4. Sair

set /p opcao=Opção:

if "%opcao%"=="1" goto :baixar_mp3
if "%opcao%"=="2" goto :baixar_720p
if "%opcao%"=="3" goto :baixar_1080p
if "%opcao%"=="4" exit /b

:baixar_mp3
cls
set /p youtube_url=Digite a URL do vídeo do YouTube: 

rem Cria um arquivo temporário em Python para baixar o vídeo do YouTube em MP3
echo from pytube import YouTube^; yt = YouTube("%youtube_url%")^; stream = yt.streams.filter(only_audio=True).first()^; stream.download(output_path=r"%caminho_downloads%\YouTubeDownloads") > download_youtube.py

rem Executa o script Python para baixar o vídeo
python download_youtube.py

rem Apaga o arquivo temporário Python
del download_youtube.py
pause
goto :menu

:baixar_720p
cls
set /p youtube_url=Digite a URL do vídeo do YouTube: 

rem Executa o script Python para baixar o vídeo em 720p
python -c "from pytube import YouTube; YouTube('%youtube_url%').streams.filter(res='720p').first().download(output_path=r'%caminho_downloads%\YouTubeDownloads')"

pause
goto :menu

:baixar_1080p
cls
set /p youtube_url=Digite a URL do vídeo do YouTube: 

rem Executa o script Python para baixar o vídeo em 1080p
python -c "from pytube import YouTube; YouTube('%youtube_url%').streams.filter(res='1080p').first().download(output_path=r'%caminho_downloads%\YouTubeDownloads')"

pause
goto :menu
