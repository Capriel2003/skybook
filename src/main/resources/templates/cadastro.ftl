<#-- @ftlvariable name="article" type="com.example.models.Article" -->
<#import "_layout.ftl" as layout />
<@layout.header>
    <div class="body-log">
        <div class="login">
            <h2 class="top-log">Cadastre-se</h2>

            <div class="barra-login">
                <form action="/skybook/cadastros" method="post">
                    <label for="nome">Nome Completo:</label>
                    <input type="text" id="nome" name="nome" required>

                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" required>

                    <label for="senha">Senha:</label>
                    <input type="password" id="senha" name="senha" required>

                    <button type="submit" class="botao-log" onclick="setLocal()">Cadastrar</button>
                </form>
            </div>

            <div class="bot-log">
                <a href="/skybook/login">Ja possui uma conta? Login</a>
            </div>

        </div>

    </div>

    <script>
        // Função para armazenar dados do usuário no cookie
        async function armazenarDadosDoUsuario() {
            const userData = { id: 1, name: 'John Doe' };

            const response = await fetch('/user/store', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(userData),
            });

            if (response.ok) {
                console.log('Dados do usuário armazenados com sucesso.');
            } else {
                console.error('Falha ao armazenar dados do usuário.');
            }
        }

        // Função para recuperar dados do usuário do cookie
        async function recuperarDadosDoUsuario() {
            const response = await fetch('/user/retrieve');

            if (response.ok) {
                const userData = await response.json();
                console.log('Dados do usuário recuperados:', userData);
            } else {
                console.error('Falha ao recuperar dados do usuário.');
            }
        }

        // Exemplos de uso
        armazenarDadosDoUsuario();
        recuperarDadosDoUsuario();
    </script>

</@layout.header>