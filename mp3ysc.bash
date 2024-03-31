#!/bin/bash

# Função para exibir a mensagem de boas-vindas
exibir_boas_vindas() {
    echo "Bem-vindo ao Consulta CPF!"
    echo "Este script realizará uma consulta de CPF utilizando a biblioteca cpf-gratis."
    echo "Por favor, siga as instruções abaixo para fornecer os dados necessários."
    echo ""
}

# Função para realizar a consulta de CPF
consultar_cpf() {
    echo "Digite o CPF que deseja consultar (apenas números):"
    read -p "> " cpf

    echo "Digite a data de nascimento associada ao CPF (formato: DDMMYYYY):"
    read -p "> " data_nascimento

    echo "Digite as letras do Captcha (caso necessário):"
    read -p "> " captcha

    # Cria um arquivo PHP para realizar a consulta de CPF
    cat <<EOF > consulta_cpf.php
<?php

require_once 'vendor/autoload.php';

\$params = JansenFelipe\CpfGratis\CpfGratis::getParams();
\$cpf = '$cpf';
\$data_nascimento = '$data_nascimento';
\$captcha = '$captcha';

\$dadosPessoa = JansenFelipe\CpfGratis\CpfGratis::consulta(
    \$cpf,
    \$data_nascimento,
    \$captcha,
    \$params['cookie'],
    ''
);

print_r(\$dadosPessoa);
?>
EOF

    # Executa o arquivo PHP para realizar a consulta de CPF
    php consulta_cpf.php
}

# Função principal
principal() {
    exibir_boas_vindas
    consultar_cpf
}

# Chama a função principal
principal
