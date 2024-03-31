#!/bin/bash

# Função para realizar a consulta de CPF
consultar_cpf() {
    local cpf="$1"
    local url="https://www.consulta-cpf-gratis.com.br/api/$cpf"
    local resposta=$(curl -s "$url")

    if [[ $resposta == *"error"* ]]; then
        echo "Consulta falhou."
        return 1
    else
        echo "$resposta"
        return 0
    fi
}

# Teste
read -p "Digite o CPF: " cpf
consultar_cpf "$cpf"
