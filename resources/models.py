from flask.json import jsonify
import mysql.connector
from datetime import datetime
from math import ceil

# =================== CONECTANDO BD ===================
def conectandoBD():
    global BD
    global cursor
    try:
        BD = mysql.connector.connect(
            user='usuario-do-seu-bd',
            host='ip-do-seu-bd',
            password='senha-do-seu-bd',
            port=3306,
            database='greenwallet'
        )
        cursor = BD.cursor()
        print('Conectado com Sucesso !')

        return ''

    except mysql.connector.Error as err:
        print(err.msg)
        return 1

# =================== LOGIN ===================
def selectLogin(email, senha):
    resposta = conectandoBD()
    if resposta == '':
        cursor.execute(f"SELECT * FROM tab_usuarios WHERE email='{email}' AND senha=SHA1('{senha}')")
        respBanco = cursor.fetchone()
        if respBanco != None:
            return respBanco
        else:
            return None
    else:
        return 'Erro ao conectar com o banco de dados'


# =================== CADASTRO ===================
def selectCadastro(nome, sobrenome, email, senha, data, sexo, renda):
    resposta = conectandoBD()
    if resposta == '':
        cursor.execute(f"SELECT COUNT(email) FROM tab_usuarios WHERE email='{email}'")
        respBD = cursor.fetchone()
        if respBD[0] >= 1:
            BD.close()
            return 'Email já utilizado!'
        else:
            cursor.execute(f"INSERT INTO tab_usuarios VALUES(0,'{nome}', '{sobrenome}', '{email}', SHA1('{senha}'), '{data}', {sexo})")
            BD.commit()
            respBD = selectLogin(email, senha)

            if respBD != None:
                cursor.execute(f"INSERT INTO tab_carteira VALUES(0, {respBD[0]}, {renda})")
                BD.commit()
                BD.close()
                return 'Cadastrado com sucesso!'
            else:
                BD.close()
                return 'Ocorreu um erro no cadastro!'


# =================== ADICIONAR GASTOS ===================
def addGasto(id_usuario, tipo, valor, pagamento, data, descricao):
    resposta = conectandoBD()
    if resposta == '':

        cursor.execute(f"SELECT MAX(id) FROM tab_gastos WHERE id_usuario = {id_usuario}")
        respBD = cursor.fetchone()
        maxID = respBD[0]
        if maxID == None:
            cursor.execute(f"INSERT INTO tab_gastos VALUES(0,{id_usuario}, {tipo}, {valor}, {pagamento}, '{data}', '{descricao}')")
            BD.commit()
            cursor.execute(f"SELECT COUNT(id) FROM tab_gastos WHERE id_usuario={id_usuario}")
            ids = cursor.fetchone()
            if ids[0] == 1:
                return 'Gasto cadastrado!'
            else:
                return 'Erro ao cadastrar'
                
        else:
            cursor.execute(f"INSERT INTO tab_gastos VALUES(0,{id_usuario}, {tipo}, {valor}, {pagamento}, '{data}', '{descricao}')")
            BD.commit()
            cursor.execute(f"SELECT MAX(id) FROM tab_gastos WHERE id_usuario = {id_usuario}")
            id = cursor.fetchone()
            if maxID < id[0]:
                return 'Gasto cadastrado!'
            else:
                return 'Erro ao cadastrar'
    else:
        return 'Ocorreu um erro'

# =================== DELETAR GASTOS ===================
def delGasto(id_usuario, id_gasto):
    resposta = conectandoBD()
    if resposta == '':
        cursor.execute(f"SELECT COUNT(id) FROM tab_gastos WHERE id_usuario = {id_usuario} AND id = {id_gasto}")
        confirm = cursor.fetchone()
        if confirm[0] == 1:
            cursor.execute(f"DELETE FROM tab_gastos WHERE id_usuario = {id_usuario} AND id = {id_gasto}")
            BD.commit()
            cursor.execute(f"SELECT COUNT(id) FROM tab_gastos WHERE id_usuario = {id_usuario} AND id = {id_gasto}")
            confirm = cursor.fetchone()
            if confirm[0] == 0:
                return "Gasto deletado!" # Gasto deletado
            else:
                return "Ocorreu um erro." # Erro no banco de dados
        else:
            return "Esse gasto não existe!" # gasto inexistente
    else:
        return "Erro no servidor." # Erro na conexão com o banco

# =================== EDITAR GASTOS ===================
def editGasto(id_gasto, id_usuario, tipo, valor, pagamento, data, descricao):
    resposta = conectandoBD()
    if resposta == '':
        cursor.execute(f"SELECT COUNT(id) FROM tab_gastos WHERE id_usuario = {id_usuario} AND id = {id_gasto}")
        confirm = cursor.fetchone()
        if confirm[0] == 1:
            cursor.execute(f"SELECT * FROM tab_gastos WHERE id={id_gasto} AND id_usuario={id_usuario}")
            antes = cursor.fetchone()
            cursor.execute(f"UPDATE tab_gastos SET tipo={tipo}, valor={valor}, pagamento={pagamento}, data_gasto='{data}', descricao='{descricao}' WHERE id={id_gasto} AND id_usuario={id_usuario}")
            BD.commit()
            cursor.execute(f"SELECT * FROM tab_gastos WHERE id={id_gasto} AND id_usuario={id_usuario}")
            depois = cursor.fetchone()
            if antes != depois:
                return "Editado com sucesso!"
            else:
                return "Erro ao editar"
        else:
            return "Esse gasto não existe"
    else:
        return "Erro no servidor"

# =================== CONSULTAR GASTOS ===================
def consultGasto(id_usuario, mes, ano):
    resposta = conectandoBD()
    if resposta == '':
        cursor.execute(f"SELECT * FROM tab_gastos WHERE id_usuario={id_usuario} AND month(data_gasto) = {mes} AND year(data_gasto) = {ano}")
        gastos = cursor.fetchall()
        dados = {}
        lista = []

        if gastos != '':
            for x in range(0, len(gastos)):
                data = datetime.strptime(str(gastos[x][5]), '%Y-%m-%d').date()
                dataFormatada = data.strftime('%Y-%m-%d')
                dados = {"id": gastos[x][0], "tipo_gasto": gastos[x][2], "valor": float(gastos[x][3]), "tipo_pagamento": gastos[x][4], "data": dataFormatada, "descricao": gastos[x][6]}
                lista.append(dados)

            return lista
        else:
            return 'Nenhum gasto cadastrado.'
    else:
        return 'Erro no servidor'

# =================== CONSULTAR CARTEIRA ===================
def consultCarteira(id_usuario):
    resposta = conectandoBD()
    if resposta == '':
        cursor.execute(f"SELECT * FROM tab_carteira WHERE id_usuario={id_usuario}")
        carteira = cursor.fetchone()

        if carteira != '':
            return carteira
        else:
            return "Carteira vazia, sem dados!"
    else:
        return "Erro no servidor"

# =================== ATUALIZAR SALDO ===================
def attSaldo(id_usuario):
    resposta = conectandoBD()
    if resposta == '':
        cursor.execute(f"SELECT SUM(valor) FROM tab_gastos WHERE id_usuario={id_usuario}")
        gastos = cursor.fetchone()
        cursor.execute(f"SELECT renda FROM tab_carteira WHERE id_usuario={id_usuario}")
        saldo = cursor.fetchone()

        try:
            saldo_restante = float(saldo[0]) - float(gastos[0])
            gastos_f = float(gastos[0])

            dados = [gastos_f, saldo_restante]

            return dados

        except:
            saldo_f = float(saldo[0])

            dados = [0, saldo_f]
            return dados

    else:
        return "Erro no servidor"

def analise_gastos(id_usuario, mes, ano):
    if conectandoBD() == '':
        cursor.execute(f"SELECT SUM(valor) FROM tab_gastos WHERE id_usuario={id_usuario} AND MONTH(data_gasto) = {mes} AND YEAR(data_gasto) = {ano}")
        dados = cursor.fetchone()
        total_gastos = float(dados[0])
        porcent_tipos = []
        gastos_tipo = []
        for x in range(0, 6):
            cursor.execute(f"SELECT SUM(valor) FROM tab_gastos WHERE id_usuario={id_usuario} AND MONTH(data_gasto) = {mes} AND YEAR(data_gasto) = {ano} AND tipo = {x}")
            dados = cursor.fetchone()
            total_tipo = dados[0]
            if total_tipo == None:
                gastos_tipo.append(0)
                porcent_tipos.append(0)
            else:
                total_tipo = float(total_tipo)
                gastos_tipo.append(total_tipo)
                porcent_tipos.append(ceil((total_tipo * 100)/total_gastos))
        
        if len(gastos_tipo) < 6 and len(porcent_tipos) < 6:
            return "Erro no servidor"
        else:
            dici_gastos = {"total_gasto1": gastos_tipo[0], "total_gasto2": gastos_tipo[1], "total_gasto3": gastos_tipo[2], "total_gasto4": gastos_tipo[3], "total_gasto5": gastos_tipo[4], "total_gasto6": gastos_tipo[5]}
            dici_porcent = {"porcent_gasto1": porcent_tipos[0], "porcent_gasto2": porcent_tipos[1], "porcent_gasto3": porcent_tipos[2], "porcent_gasto4": porcent_tipos[3], "porcent_gasto5": porcent_tipos[4], "porcent_gasto6": porcent_tipos[5]}
            return dici_gastos, dici_porcent
    else:
        return "Erro no servidor"
    
# ----------------------------------------- ROTAS DO USUÁRIO ---------------------------------------------------------

# =================== ATUALIZAÇÃO DE RENDA DO USUÁRIO ===================
def attRenda(id_usuario, renda, senha):
    try:
        conectandoBD()
        cursor.execute(f"SELECT COUNT(id) FROM tab_usuarios WHERE id={id_usuario} AND senha=SHA1('{senha}')")
        dados = cursor.fetchone()
        if dados[0] == 1:
            cursor.execute(f"UPDATE tab_carteira, tab_usuarios SET tab_carteira.renda={renda} WHERE tab_carteira.id_usuario={id_usuario} AND tab_usuarios.senha=SHA1('{senha}')")
            BD.commit()
            return "Renda atualizada"
        else:
            return "Senha incorreta"
    except:
        return "Erro no servidor"

# =================== ATUALIZAÇÃO DO EMAIL DO USUÁRIO ===================
def attEmail(id_usuario, email, senha):
    try:
        conectandoBD()
        cursor.execute(f"SELECT COUNT(id) FROM tab_usuarios WHERE email='{email}'")
        dados = cursor.fetchone()
        if dados[0] >= 1:
            return "Email já utilizado"
        else:
            cursor.execute(f"SELECT COUNT(id) FROM tab_usuarios WHERE id={id_usuario} AND senha=SHA1('{senha}')")
            dados = cursor.fetchone()
            if dados[0] == 1:
                cursor.execute(f"UPDATE tab_usuarios SET email='{email}' WHERE id={id_usuario} AND senha=SHA1('{senha}')")
                BD.commit()
                return "Email atualizado"
            else:
                return "Senha incorreta"
    except:
        return "Erro no servidor"


def attSenha(id_usuario, novaSenha, antigaSenha):
    try:
        conectandoBD()
        cursor.execute(f"SELECT COUNT(id) FROM tab_usuarios WHERE id={id_usuario} AND senha=SHA1('{antigaSenha}')")
        dados = cursor.fetchone()
        if dados[0] == 1:
            cursor.execute(f"UPDATE tab_usuarios SET senha=SHA1('{novaSenha}') WHERE id={id_usuario}")
            BD.commit()
            return "Senha alterada"
        else:
            return "Senha incorreta"
    except:
        return "Erro no servidor"
