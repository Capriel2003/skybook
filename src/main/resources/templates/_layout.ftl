<#macro header>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>VOO</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="/static/css/style.css" />
        <link rel="stylesheet" type="text/css" href="/static/css/cadastro.css"/>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
                crossorigin="anonymous"></script>
        <script defer src="/static/javaScript/animationMap.js"></script>
        <script defer src="/static/javaScript/storage.js"></script>

    </head>

    <body style="text-align: center; font-family: sans-serif">
    <nav class="navbar navbar-expand-lg bg-body-tertiary">
        <div class="container-fluid">
            <img src="https://cdn-icons-png.flaticon.com/512/7893/7893979.png" alt="aviao" class="imageLogo">
            <a class="navbar-brand" href="/articles">VOO - Passagens Aéreas</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false"
                    aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" class="topo" id="navbarTogglerDemo02">
            </div>

            <div class="topo">
                <a href="/articles/home">Home</a>
                <a href="#">Promoções</a>
                <a href="/articles/cadastros" id="sumir1" style="display: block">Cadastro</a>
                <a>Nome</a>
            </div>
        </div>
    </nav>


    <#nested>
    </body>

    </html>
</#macro>