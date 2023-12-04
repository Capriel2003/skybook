<#import "_layout.ftl" as layout />
<@layout.header><!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Venda de Passagens Aéreas</title>
    <style>
        #passagens {
            font-family: Arial, sans-serif;
            margin: 20px;
        }

        h1 {
            text-align: center;
        }

        .passagem {
            border: 1px solid #ccc;
            padding: 10px;
            margin-bottom: 15px;
        }

        button {
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
</head>
<body>

<h1>Escolha sua Passagem Aérea</h1>

<#list voos as voo>
    <div id="passagens">
<div class="passagem">
    <form action="/skybook/assentos" method="post">
        <h2 id = "compania">${voo.compania}</h2>
        <p id = "origem">Origem: ${voo.origem}</p>
        <p id = "destino"> Destino: ${voo.destino}</p>
        <p id = "data"> Data: ${data}</p>
        <p id = "preco"> Preço: R$ ${voo.preco}</p>
        <button name="botao" value="${voo.index}">Comprar</button>
    </form>
</div>
    </div>
</#list>

</@layout.header>
