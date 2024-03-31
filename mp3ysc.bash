#!/bin/bash

consultar_cpf() {
    local cpf="$1"
    local url="https://servicos.receita.fazenda.gov.br/Servicos/cpf/${cpf}/ConsultaSituacao/CPFConsulta.asp"
    local response=$(curl -s "$url")

    # Extrair nome
    nome=$(echo "$response" | grep -oP '(?<=<span id="txtNome">)[^<]+')
    if [ -z "$nome" ]; then
        nome="Nome não encontrado."
    fi

    # Extrair situação cadastral
    situacao=$(echo "$response" | grep -oP '(?<=<span id="txtSituacao">)[^<]+')
    if [ -z "$situacao" ]; then
        situacao="Situação cadastral não encontrada."
    fi

    # Extrair data de nascimento
    data_nascimento=$(echo "$response" | grep -oP '(?<=<span id="txtDtNascimento">)[^<]+')
    if [ -z "$data_nascimento" ]; then
        data_nascimento="Data de nascimento não encontrada."
    fi

    # Exibir informações
    echo "Nome: $nome"
    echo "Situação Cadastral: $situacao"
    echo "Data de Nascimento: $data_nascimento"
}

# Teste
read -p "Digite o CPF: " cpf
consultar_cpf "$cpf"
