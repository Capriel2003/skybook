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

                    <button type="submit" class="botao-log">Cadastrar</button>
                </form>
            </div>

            <div class="bot-log">
                <a href="/skybook/login" >Ja possui uma conta? Login</a>
            </div>

        </div>

    </div>


</@layout.header>