#!/bin/bash

# Função para realizar a consulta de CPF
consultar_cpf() {
    local cpf=$1
    local url="https://consulta-situacao-cpf.com/$cpf"
    local resposta=$(curl -s "$url")
    echo "$resposta"
}

# Função principal
main() {
    clear
    echo "Consulta de CPF"
    echo "---------------------"
    read -p "Digite o CPF: " cpf

    if ! [[ $cpf =~ ^[0-9]{11}$ ]]; then
        echo "CPF inválido. Por favor, insira um CPF válido com 11 dígitos numéricos."
        exit 1
    fi

    resultado=$(consultar_cpf "$cpf")

    # Extrair informações do HTML
    nome=$(echo "$resultado" | grep -oP '(?<=Nome: <strong>)[^<]+')
    situacao=$(echo "$resultado" | grep -oP '(?<=Situação: <strong>)[^<]+')
    data=$(echo "$resultado" | grep -oP '(?<=Data: <strong>)[^<]+')
    cidade=$(echo "$resultado" | grep -oP '(?<=Cidade: <strong>)[^<]+')
    estado=$(echo "$resultado" | grep -oP '(?<=Estado: <strong>)[^<]+')

    # Exibir resultados
    echo "Nome: $nome"
    echo "Situação: $situacao"
    echo "Data: $data"
    echo "Cidade: $cidade"
    echo "Estado: $estado"
}

# Chamada da função principal
main
