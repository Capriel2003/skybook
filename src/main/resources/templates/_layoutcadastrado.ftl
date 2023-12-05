<#-- @ftlvariable name="cadastros" type="kotlin.collections.List<com.example.models.Cadastro>" -->
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
            <a class="navbar-brand" href="/skybook">VOO - Passagens Aéreas</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false"
                    aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse d-flex justify-content-end" id="navbarTogglerDemo02">
                <div class="topo d-flex">
                    <a href="/skybook">Home</a>
                    <a href="/skybook/promocao">Promoções</a>

                    <div class="dropdown">
                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown"
                           aria-haspopup="true" aria-expanded="false">
                            ${pessoa.nome}
                        </a>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                            <a class="dropdown-item" id="logoutLink" href="#">Deslogar</a>
                        </div>
                    </div>
                    <script>
                        // Adiciona um evento de clique ao link de logout
                        document.getElementById('logoutLink').addEventListener('click', function (event) {
                            event.preventDefault(); // Impede o comportamento padrão do link

                            // Faz uma requisição para o endpoint de deslogar
                            fetch('/skybook/logout', { method: 'POST' })
                                .then(response => {
                                    if (response.ok) {
                                        console.log('Usuário deslogado com sucesso.');
                                        window.location.href = '/skybook/cadastros';
                                    } else {
                                        console.error('Erro ao deslogar o usuário.');
                                    }
                                })
                                .catch(error => {
                                    console.error('Erro de rede:', error);
                                });
                        });
                    </script>
                </div>
            </div>
        </div>
    </nav>



    <#nested>
    </body>

    </html>

</#macro>