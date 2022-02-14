from flask import Blueprint, json, jsonify, request
from .models import selectLogin, selectCadastro, addGasto, delGasto, editGasto, consultGasto, consultCarteira, attSaldo, analise_gastos, attRenda, attEmail, attSenha
from datetime import datetime, timedelta
from .functions import verificacao

# Criando Blueprint
rotasR = Blueprint('rotasR', __name__)

#====================== Login ======================
@rotasR.route('/login', methods=['POST'])
def login():
    email = request.json['email_l']
    senha = request.json['password_l']
    resposta = selectLogin(email, senha)
    if resposta != None:
        data = datetime.strptime(str(resposta[5]), '%Y-%m-%d').date()
        dataFormatada = data.strftime('%d-%m-%Y')

        return jsonify(
            id=resposta[0],
            nome=resposta[1],
            sobrenome=resposta[2],
            email=resposta[3],
            data=dataFormatada,
            sexo=resposta[6]
        ), 200  # Sucesso, login VÁLIDO

    else:
        return jsonify(msg='Email ou senha nao existentes !'), 203  # Sucesso, porém login INVÁLIDO

#====================== Cadastro ======================
@rotasR.route('/register', methods=['POST'])
def cadastro():
    nome = request.json['name_c'] #string
    sobrenome = request.json['surname_c'] #string
    email = request.json['email_c'] #string
    senha = request.json['password_c'] #string
    data = f'{datetime.now().date().year}-{datetime.now().date().month}-{datetime.now().date().day}'
    sexo = request.json['gender'] # int: 0 = masculino | 1 = feminino | 2 = outro
    renda = request.json['income'] # float
    resposta = selectCadastro(nome, sobrenome, email, senha, data, sexo, renda)

    if resposta == 'Cadastrado com sucesso!':
        return jsonify(msg='Cadastro concluido com sucesso!'), 201 # Created, cadatro criado com sucesso
    if resposta == 'Email já utilizado!':
        return jsonify(msg='Email ja utilizado.'), 200 # Sucesso a fazer requisição, porém email já usado
    else:
        return jsonify(msg='Erro ao concluir o cadastro.'), 502 # Erro no servidor ao concluir cad

#====================== Cadastro de GASTOS ======================
@rotasR.route('/addspent', methods=['POST'])
def gasto():
    id = request.json['id_usuario'] #int
    tipo = request.json['tipo_gasto'] #int
    valor = request.json['valor_gasto'] #decimal
    pagamento = request.json['tipo_pagamento'] #int
    data = request.json['data_gasto'] #data
    descricao = request.json['descricao'] #string

    resposta = addGasto(id, tipo, valor, pagamento, data, descricao)

    if resposta == 'Gasto cadastrado!':
        return jsonify(msg="Gasto cadastrado com sucesso!"), 201 # Created, gasto cadastrado
    elif resposta == 'Erro ao cadastrar':
        return jsonify(msg="Ocorreu um erro ao cadastrar."), 200 # Sucesso a fazer requisição, porém erro ao cadastrar gasto
    else:
        return jsonify(msg="Ocorreu um erro interno. Tente novamente em minutos."), 502 # Erro no servidor

#====================== Remoção de GASTOS ======================
@rotasR.route('/delspent', methods=['POST'])
def delgasto():
    id = request.json['id_gasto'] #int
    id_usuario = request.json['id_usuario'] #int

    resposta = delGasto(id_usuario, id)

    if resposta == "Gasto deletado!":
        return jsonify(msg="Gasto deletado com sucesso!"), 200 # OK, gasto deletado
    elif resposta == "Ocorreu um erro.":
        return jsonify(msg="Ocorreu um erro ao deletar."), 202 # Requisição OK, porém erro ao deletar gasto.
    elif resposta == "Esse gasto não existe!":
        return jsonify(msg="Gasto inexistente!"), 202 # Requisição OK, porém gasto inexistente.
    else:
        return jsonify(msg="Ocorreu um erro interno. Tente novamente em minutos."), 502 # Erro no servidor

#====================== Edição de GASTOS ======================
@rotasR.route('/editspent', methods=['POST'])
def editgasto():
    id_gasto = request.json['id_gasto'] #int
    id_usuario = request.json['id_usuario'] #int
    tipo = request.json['tipo_gasto'] #int
    valor = request.json['valor_gasto'] #decimal
    pagamento = request.json['tipo_pagamento'] #int
    data = request.json['data_gasto'] #data (string)
    descricao = request.json['descricao'] #string(50)

    resposta = editGasto(id_gasto, id_usuario, tipo, valor, pagamento, data, descricao)

    if resposta == "Editado com sucesso!":
        return jsonify(msg="Gasto editado com sucesso!"), 200 # OK, gasto editado
    elif resposta == "Erro ao editar":
        return jsonify(msg="Ocorreu um erro ao editar."), 202 # Requisição OK, porém erro ao editar gasto
    elif resposta == "Esse gasto não existe":
        return jsonify(msg="Gasto inexistente!"), 202 # Requisição OK, porém gasto inexistente.
    else:
        return jsonify(msg="Ocorreu um erro interno. Tente novamente em minutos."), 502 # Erro no servidor

#====================== Consulta de GASTOS ======================
@rotasR.route('/consultspent', methods=['POST'])
def consultSpench():
    id_usuario = request.json['id_usuario']
    mes = request.json['mes']
    ano = request.json['ano']

    resposta = consultGasto(id_usuario, mes, ano)

    if resposta == 'Nenhum gasto cadastrado.':
        return jsonify(msg="Nenhum gasto foi cadastrado."), 200 # Requisição OK, porém nenhum gasto cadastrado.
    elif resposta == 'Erro no servidor':
        return jsonify(msg="Ocorreu um erro interno. Tente novamente em minutos."), 502 # Erro no servidor
    else:
        return jsonify(resposta)

#====================== Consulta de Carteira ======================
@rotasR.route('/consultwallet', methods=['POST'])
def consultWallet():
    id_usuario = request.json['id_usuario']

    resposta = consultCarteira(id_usuario)

    if resposta == "Carteira vazia, sem dados!":
        return jsonify(msg="Carteira não possui dados!"), 200 # Requisição OK, porém nenhum dado na carteira.
    elif resposta == "Erro no servidor":
        return jsonify(msg="Ocorreu um erro interno. Tente novamente em minutos."), 502 # Erro no servidor
    else:
        renda = float(resposta[2])

        return jsonify(id=resposta[0],
        renda=renda)

#====================== Atualização de saldo(dinheiro restante) do usuário ======================
@rotasR.route('/attbalance', methods=['POST'])
def attBalance():
    id_usuario = request.json['id_usuario']

    resposta = attSaldo(id_usuario)

    if resposta == "Erro no servidor":
        return jsonify(msg="Ocorreu um erro interno. Tente novamente em minutos."), 502 # Erro no servidor
    else:
        return jsonify(saldo=resposta[1], gastos=resposta[0]), 200

@rotasR.route('/gethistory', methods=['POST'])
def getHistory():
    id_usuario = request.json['id_usuario']
    mes = request.json['mes']
    ano = request.json['ano']

    resposta = analise_gastos(id_usuario, mes, ano)

    if resposta == "Erro no servidor":
        return jsonify(msg="Ocorreu um erro interno. Tente novamente em minutos."), 502
    else:
        return jsonify(gastos=resposta[0], porcentagens=resposta[1]), 200
    
#====================== Atualização de renda do usuário ======================
@rotasR.route('/user/attincome', methods=['POST'])
def userAttIncome():
    id_usuario = request.json['id_usuario']
    renda = request.json['renda']
    senha = request.json['senha']

    resposta = attRenda(id_usuario, renda, senha)

    if resposta == "Erro no servidor":
        return jsonify(msg="Ocorreu um erro interno. Tente novamente em minutos."), 502 # Erro no servidor.
    elif resposta == "Senha incorreta":
        return jsonify(msg="Senha incorreta."), 209 # Senha incorreta, dados NÃO alterados no banco.
    else:
        return jsonify(msg="Renda atualizada com sucesso!"), 200 # OK, renda alterada!

#====================== Atualização do email do usuário ======================
@rotasR.route('/user/attemail', methods=['POST'])
def userAttEmail():
    id_usuario = request.json['id_usuario']
    email = request.json['email']
    senha = request.json['senha']

    resposta = attEmail(id_usuario, email, senha)

    if resposta == "Erro no servidor":
        return jsonify(msg="Ocorreu um erro interno. Tente novamente em minutos."), 502 # Erro no servidor.
    elif resposta == "Email já utilizado":
        return jsonify(msg="Este email já está sendo utilizado."), 202 # Email já utilizado, dados NÃO alterados no banco.
    elif resposta == "Senha incorreta":
        return jsonify(msg="Senha incorreta."), 209 # Senha incorreta, dados NÃO alterados no banco.
    else:
        return jsonify(msg="Email alterado com sucesso!"), 200 # OK, email alterado!

#====================== Atualização de senha do usuário ======================
@rotasR.route('/user/attpassword', methods=['POST'])
def userAttPassword():
    id_usuario = request.json['id_usuario']
    novaSenha = request.json['nova_senha']
    antigaSenha = request.json['antiga_senha']

    resposta = attSenha(id_usuario, novaSenha, antigaSenha)

    if resposta == "Erro no servidor":
        return jsonify(msg="Ocorreu um erro interno. Tente novamente em minutos."), 502 # Erro no servidor.
    elif resposta == "Senha incorreta":
        return jsonify(msg="Senha incorreta."), 209 # Senha incorreta, dados NÃO alterados no banco.
    else:
        return jsonify(msg="Senha alterada com sucesso!"), 200 # OK, senha alterada!
