<#import "_layoutcadastrado.ftl" as layout />
<@layout.header>

        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
            }

            h1 {
                text-align: center;
                color: #ffffff;
                padding: 20px;
                margin: 0;
                margin-top: 10px;
            }

            #passagens {
                margin-top: 50px;
                display: flex;
                justify-content: center;
                align-items: center;
                flex-wrap: wrap;
                gap: 20px;
                padding: 20px;
            }

            .passagem {
                background: #ffffff;
                border: 1px solid #ccc;
                padding: 20px;
                border-radius: 10px;
                width: 300px;
                text-align: center;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            h2 {
                color: #4CAF50;
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

    <h1><b>Escolha sua Passagem Aérea</b></h1>

    <div id="passagens">
        <#list voos as voo>
            <div class="passagem">
                <form action="/skybook/assentos" method="post">
                    <h2 id="compania">${voo.compania}</h2>
                    <p id="origem">Origem: ${voo.origem}</p>
                    <p id="destino"> Destino: ${voo.destino}</p>
                    <p id="data"> Data: ${data}</p>
                    <p id="preco"> Preço: R$ ${voo.preco}</p>
                    <button name="botao" value="${voo.index}">Comprar</button>
                </form>
            </div>
        </#list>
    </div>

</@layout.header>
