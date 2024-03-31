#!/bin/bash

# Instala o PHP e o Composer se ainda não estiverem instalados
pkg update
pkg upgrade
pkg install php
pkg install composer

# Inicializa um novo projeto PHP e instala o pacote cpf-gratis
mkdir consultar-cpf
cd consultar-cpf
composer init -n
composer require jansenfelipe/cpf-gratis

# Cria um arquivo PHP para realizar as consultas de CPF
cat <<EOF > consulta_cpf.php
<?php

require_once 'vendor/autoload.php';

\$params = JansenFelipe\CpfGratis\CpfGratis::getParams(); 

echo "Digite o CPF que deseja consultar (apenas números):" . PHP_EOL;
\$cpf = readline("> ");

echo "Digite a data de nascimento associada ao CPF (formato: DDMMYYYY):" . PHP_EOL;
\$data_nascimento = readline("> ");

echo "Digite as letras do Captcha (deixe em branco se não houver):" . PHP_EOL;
\$captcha = readline("> ");

\$dadosPessoa = JansenFelipe\CpfGratis\CpfGratis::consulta(
    \$cpf,
    \$data_nascimento,
    \$captcha,
    \$params['cookie'],
    ''
);

print_r(\$dadosPessoa);
EOF

# Executa o script PHP para iniciar uma consulta de CPF
php consulta_cpf.php
