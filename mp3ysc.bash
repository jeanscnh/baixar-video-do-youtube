import matplotlib.pyplot as plt
import time

def mostrar_emoji():
    # Figura do emoji
    emoji = [
        [0, 0, 1, 1, 1, 1, 0, 0],
        [0, 1, 1, 1, 1, 1, 1, 0],
        [1, 1, 1, 1, 1, 1, 1, 1],
        [1, 1, 1, 1, 1, 1, 1, 1],
        [1, 1, 1, 1, 1, 1, 1, 1],
        [1, 1, 1, 1, 1, 1, 1, 1],
        [0, 1, 1, 1, 1, 1, 1, 0],
        [0, 0, 1, 1, 1, 1, 0, 0]
    ]

    # Plotar o emoji
    plt.imshow(emoji, cmap='gray')
    plt.axis('off')  # Desativar eixos
    plt.show()

def main():
    # Mostrar o emoji
    mostrar_emoji()

    # Tempo de pausa em segundos
    tempo_de_pausa = 120  # 2 minutos

    # Pausa a execução por um determinado período de tempo
    print(f"A tela ficará estática por {tempo_de_pausa} segundos.")
    time.sleep(tempo_de_pausa)
    print("Tempo esgotado. Saindo...")

if __name__ == "__main__":
    main()
