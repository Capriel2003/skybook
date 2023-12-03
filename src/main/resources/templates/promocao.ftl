<#-- @ftlvariable name="article" type="com.example.models.Article" -->
<#import "_layout.ftl" as layout />
<@layout.header>

    <style>
        #promo {
            font-family: Arial, sans-serif;
            margin-left: 150px;
            margin-right: 150px;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            flex-wrap: wrap;
        }

        .card {
            box-sizing: border-box;
            width: 30%; /* 30% width for three cards per row */
            margin: 30px;
            margin-right: 0; /* No right margin for the last card in each row */
            background-color: #fff;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column;
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
            font-si    ze: 14px;
            color: #666;
        }

        @media (max-width: 1200px) {
            .card {
                width: calc(33.33% - 20px);
            }
        }

        @media (max-width: 768px) {
            .card {
                width: calc(50% - 20px);
            }
        }

        @media (max-width: 480px) {
            .card {
                width: 100%;
            }
        }
    </style>
    <div id="promo">

    <div class="card">
        <img src="https://via.placeholder.com/300" alt="Imagem 1">
        <div class="card-content">
            <h2>Título do Card 1</h2>
            <p>Alguma descrição curta do card.</p>
        </div>
    </div>

    <div class="card">
        <img src="https://via.placeholder.com/300" alt="Imagem 2">
        <div class="card-content">
            <h2>Título do Card 2</h2>
            <p>Outra descrição curta do card.</p>
        </div>
    </div>

    <div class="card">
        <img src="https://via.placeholder.com/300" alt="Imagem 3">
        <div class="card-content">
            <h2>Título do Card 3</h2>
            <p>Mais uma descrição curta do card.</p>
        </div>
    </div>

    <div class="card">
        <img src="https://via.placeholder.com/300" alt="Imagem 1">
        <div class="card-content">
            <h2>Título do Card 1</h2>
            <p>Alguma descrição curta do card.</p>
        </div>
    </div>

    <div class="card">
        <img src="https://via.placeholder.com/300" alt="Imagem 2">
        <div class="card-content">
            <h2>Título do Card 2</h2>
            <p>Outra descrição curta do card.</p>
        </div>
    </div>

    <div class="card">
        <img src="https://via.placeholder.com/300" alt="Imagem 3">
        <div class="card-content">
            <h2>Título do Card 3</h2>
            <p>Mais uma descrição curta do card.</p>
        </div>
    </div>
    </div>
</@layout.header>