from datetime import datetime

#=================== Verificação Segurança =====================
def verificacao(palavra):
    with open('palavras.txt', 'r') as lista:
        palavras = lista.readlines()
        keys = []
        for x in palavras:
            keys.append(x.strip())

        if palavra in keys:
            return True
        else:
            return False
