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
            height: auto;
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

        <form id="promo">
            <div class="card">

                <a href="/skybook/passagens" name="card1">
                    <img src="/static/Imagens/${voos[775].destino}.jpeg" alt="Imagem 1">
                    <div class="card-content">
                        <h2>Título do Card 1</h2>
                        <p>Alguma descrição curta do card.</p>
                    </div>
                </a>

            </div>

            <div class="card">

                <a href="#" name="card2">
                    <img src="/static/Imagens/${voos[214].destino}.jpeg" alt="Imagem 2">
                    <div class="card-content">
                        <h2>Título do Card 2</h2>
                        <p>Outra descrição curta do card.</p>
                    </div>
                </a>

            </div>

            <div class="card">

                <a href="#" name="card3">
                    <img src="/static/Imagens/${voos[1282].destino}.jpeg" alt="Imagem 3">
                    <div class="card-content">
                        <h2>Título do Card 3</h2>
                        <p>Mais uma descrição curta do card.</p>
                    </div>
                </a>

            </div>

            <div class="card">

                <a href="#" name="card4">
                    <img src="/static/Imagens/${voos[129].destino}.jpeg" alt="Imagem 1">
                    <div class="card-content">
                        <h2>Título do Card 1</h2>
                        <p>Alguma descrição curta do card.</p>
                    </div>
                </a>

            </div>

            <div class="card">

                <a href="/skybook/passagens" name="card5">
                    <img src="/static/Imagens/Acre.jpeg" alt="Imagem 2">
                    <div class="card-content">
                        <h2>Título do Card 2</h2>
                        <p>Outra descrição curta do card.</p>
                    </div>
                </a>

            </div>

            <div class="card" name="card6">

                <a href="#">
                    <img src="/static/Imagens/${voos[24].destino}.jpeg" alt="Imagem 3">
                    <div class="card-content">
                        <h2>Título do Card 3</h2>
                        <p>Mais uma descrição curta do card.</p>
                    </div>
                </a>

            </div>
        </form>

</@layout.header>
