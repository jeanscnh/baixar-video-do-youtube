#!/bin/bash

# Função para realizar a consulta de CPF
consultar_cpf() {
    local cpf=$1
    local url="https://api.cpfcnpj.com.br/5f702c7c350a970b4a8a3324f9624bfc/consultar-cpf/$cpf"
    local resposta=$(curl -s "$url")
    echo "$resposta"
}

# Função para exibir o resultado da consulta
exibir_resultado() {
    local resultado_json="$1"
    local nome=$(echo "$resultado_json" | jq -r '.nome')
    local situacao=$(echo "$resultado_json" | jq -r '.situacao')
    local data=$(echo "$resultado_json" | jq -r '.data')
    local mensagem=$(echo "$resultado_json" | jq -r '.mensagem')

    echo "Nome: $nome"
    echo "Situação: $situacao"
    echo "Data: $data"
    echo "Mensagem: $mensagem"
}

# Verificar se o jq está instalado
if ! command -v jq &> /dev/null; then
    echo "O comando jq não foi encontrado. Instalando jq..."
    pkg install jq -y
    clear
fi

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

    if [[ -z $resultado ]]; then
        echo "Erro ao consultar o CPF. Verifique sua conexão com a internet ou tente novamente mais tarde."
        exit 1
    fi

    status=$(echo "$resultado" | jq -r '.status')

    if [[ $status == "OK" ]]; then
        exibir_resultado "$resultado"
    else
        mensagem_erro=$(echo "$resultado" | jq -r '.mensagem')
        echo "Erro: $mensagem_erro"
    fi
}

# Chamada da função principal
main
