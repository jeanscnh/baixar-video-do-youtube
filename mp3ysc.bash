#!/bin/bash

# Figura do emoji
emoji='[
[0, 0, 1, 1, 1, 1, 0, 0],
[0, 1, 1, 1, 1, 1, 1, 0],
[1, 1, 1, 1, 1, 1, 1, 1],
[1, 1, 1, 1, 1, 1, 1, 1],
[1, 1, 1, 1, 1, 1, 1, 1],
[1, 1, 1, 1, 1, 1, 1, 1],
[0, 1, 1, 1, 1, 1, 1, 0],
[0, 0, 1, 1, 1, 1, 0, 0]
]'

# Exibir o emoji usando o comando 'echo'
echo "$emoji" | python -c "
import matplotlib.pyplot as plt

# Plotar o emoji
plt.imshow($emoji, cmap='gray')
plt.axis('off')  # Desativar eixos
plt.show()
"

# Tempo de pausa em segundos
tempo_de_pausa=120  # 2 minutos

# Pausa a execução por um determinado período de tempo
echo "A tela ficará estática por $tempo_de_pausa segundos."
sleep $tempo_de_pausa
echo "Tempo esgotado. Saindo..."
