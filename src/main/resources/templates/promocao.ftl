<#import "_layout.ftl" as layout />
<@layout.header>

    <style>
        #promo {
            font-family: Arial, sans-serif;
            margin-left: 100px;
            margin-right: 100px;
            padding: 50px;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            flex-wrap: wrap;
        }

        .card {
            box-sizing: border-box;
            width: 25%; /* 30% width for three cards per row */
            margin: 20px;
            background-color: #fff;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column;
        }

        .card a {
            text-decoration: none; /* Remove sublinhado padrão do link */
            color: inherit; /* Herda a cor do texto do pai (evita cores padrão do link) */
        }

        .card img {
            width: 100%;
            height: 250px;
            border-bottom: 1px solid #ddd;
        }

        .card-content {
            padding: 15px;
            flex: 1; /* Para ocupar o espaço restante verticalmente */
        }

        h2 {
            margin-top: 0;
            font-size: 18px;
            color: #333;
        }

        p {
            font-size: 14px;
            color: #666;
        }

        .img {
            height: 300px;
            width: 500px;
        }

        @media (max-width: 1200px) {
            .card {
                width: calc(33.33% - 40px);
            }
        }

        @media (max-width: 768px) {
            .card {
                width: calc(50% - 40px);
            }
        }

        @media (max-width: 480px) {
            .card {
                width: 100%;
            }
        }
    </style>

        <form>
            <div id="promo">
            <div class="card">

                <a name="card1">
                    <img src="/static/Imagens/${voos[promocoes[0]].destino}.jpg" alt="Imagem1" class = "img">
                    <div class="card-content">
                        <h2>${voos[promocoes[0]].destino}</h2>
                        <p>Origem: ${voos[promocoes[0]].origem}</p>
                        <p>Companhia Aérea : ${voos[promocoes[0]].compania}</p>
                        <p>Preco: R$${voos[promocoes[0]].preco},00</p>
                        <form action="/skybook/assentos" method="post">
                            <button name="botao" value="${voos[promocoes[0]].index}">Comprar</button>
                        </form>
                    </div>
                </a>

            </div>

            <div class="card">

                <a name="card2">
                    <img src="/static/Imagens/${voos[promocoes[1]].destino}.jpg" alt="Imagem 2" class = "img">
                    <div class="card-content">
                        <h2>${voos[promocoes[1]].destino}</h2>
                        <p>Origem: ${voos[promocoes[1]].origem}</p>
                        <p>Companhia Aérea : ${voos[promocoes[1]].compania}</p>
                        <p>Preco: R$${voos[promocoes[1]].preco},00</p>
                        <form action="/skybook/assentos" method="post">
                            <button name="botao" value="${voos[promocoes[1]].index}">Comprar</button>
                        </form>
                    </div>
                </a>

            </div>

            <div class="card">

                <a name="card3">
                    <img src="/static/Imagens/${voos[promocoes[2]].destino}.jpg" alt="Imagem 3" class = "img">
                    <div class="card-content">
                        <h2>${voos[promocoes[2]].destino}</h2>
                        <p>Origem: ${voos[promocoes[2]].origem}</p>
                        <p>Companhia Aérea : ${voos[promocoes[2]].compania}</p>
                        <p>Preco: R$${voos[promocoes[2]].preco},00</p>
                        <form action="/skybook/assentos" method="post">
                            <button name="botao" value="${voos[promocoes[2]].index}">Comprar</button>
                        </form>
                    </div>
                </a>

            </div>

            <div class="card">

                <a  name="card4">
                    <img src="/static/Imagens/${voos[promocoes[3]].destino}.jpg" alt="Imagem 1" class = "img">
                    <div class="card-content">
                        <h2>${voos[promocoes[3]].destino}</h2>
                        <p>Origem: ${voos[promocoes[3]].origem}</p>
                        <p>Companhia Aérea : ${voos[promocoes[3]].compania}</p>
                        <p>Preco: R$${voos[promocoes[3]].preco},00</p>
                        <form action="/skybook/assentos" method="post">
                            <button name="botao" value="${voos[promocoes[3]].index}">Comprar</button>
                        </form>
                    </div>
                </a>

            </div>

            <div class="card">

                <a name="card5">
                    <img src="/static/Imagens/${voos[promocoes[4]].destino}.jpg" alt="Imagem 2" class = "img">
                    <div class="card-content">
                        <h2>${voos[promocoes[4]].destino}</h2>
                        <p>Origem: ${voos[promocoes[4]].origem}</p>
                        <p>Companhia Aérea : ${voos[promocoes[4]].compania}</p>
                        <p>Preco: R$${voos[promocoes[4]].preco},00</p>
                        <form action="/skybook/assentos" method="post">
                            <button name="botao" value="${voos[promocoes[4]].index}">Comprar</button>
                        </form>
                    </div>
                </a>

            </div>

            <div class="card" name="card6">

                <a name="card6">
                    <img src="/static/Imagens/${voos[promocoes[5]].destino}.jpg" alt="Imagem 3" class = "img">
                    <div class="card-content">
                        <h2>${voos[promocoes[5]].destino}</h2>
                        <p>Origem: ${voos[promocoes[5]].origem}</p>
                        <p>Companhia Aérea : ${voos[promocoes[5]].compania}</p>
                        <p>Preco: R$${voos[promocoes[5]].preco},00</p>
                        <form action="/skybook/assentos" method="post">
                            <button name="botao" value="${voos[promocoes[5]].index}">Comprar</button>
                        </form>
                    </div>
                </a>

            </div>
            </div>
        </form>

</@layout.header>
