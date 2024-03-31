import requests
from bs4 import BeautifulSoup

def consultar_cpf(cpf):
    url = f"https://www.consulta-cpf-gratis.com.br/api/{cpf}"
    response = requests.get(url)

    if response.status_code == 200:
        return response.json()
    else:
        print("Erro ao consultar a API.")
        return None

# Teste
cpf = input("Digite o CPF: ")
informacoes = consultar_cpf(cpf)

if informacoes:
    print("Nome:", informacoes["nome"])
    print("Situação:", informacoes["situacao"])
    print("Data de Nascimento:", informacoes["data_nascimento"])
else:
    print("Consulta falhou.")
