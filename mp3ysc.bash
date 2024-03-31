import requests
from bs4 import BeautifulSoup

def consultar_cpf(cpf):
    url = f"https://servicos.receita.fazenda.gov.br/Servicos/cpf/{cpf}/ConsultaSituacao/CPFConsulta.asp"
    try:
        response = requests.get(url)
        response.raise_for_status()  # Verificar se houve erro na requisição

        soup = BeautifulSoup(response.content, 'html.parser')
        nome_element = soup.find("span", id="txtNome")
        if nome_element:
            nome = nome_element.text.strip()
        else:
            nome = "Nome não encontrado."

        situacao_element = soup.find("span", id="txtSituacao")
        if situacao_element:
            situacao = situacao_element.text.strip()
        else:
            situacao = "Situação não encontrada."

        data_nascimento_element = soup.find("span", id="txtDtNascimento")
        if data_nascimento_element:
            data_nascimento = data_nascimento_element.text.strip()
        else:
            data_nascimento = "Data de nascimento não encontrada."

        return {"nome": nome, "situacao": situacao, "data_nascimento": data_nascimento}
    
    except requests.exceptions.RequestException as e:
        return {"error": f"Erro na requisição HTTP: {str(e)}"}
    except Exception as e:
        return {"error": f"Erro inesperado: {str(e)}"}

# Teste
cpf = input("Digite o CPF: ")
informacoes = consultar_cpf(cpf)
if "error" in informacoes:
    print(informacoes["error"])
else:
    print("Nome:", informacoes["nome"])
    print("Situação:", informacoes["situacao"])
    print("Data de Nascimento:", informacoes["data_nascimento"])
