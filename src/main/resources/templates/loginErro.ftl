<#-- @ftlvariable name="article" type="com.example.models.Article" -->
<#import "_layout.ftl" as layout />
<@layout.header>
    <div class="body-log">
        <div class="login">
            <h2 class="top-log">Login</h2>

            <div class="barra-login">
                <p style="color: red">Email ou Senha inválidos</p>
                <form action="/skybook/login" method="post">
                    <label for="email">Email:</label>
                    <input type="text" id="email" name="email" required>

                    <label for="senha">Senha:</label>
                    <input type="password" id="senha" name="senha" required>

                    <button type="submit" class="botao-log">Cadastrar</button>
                </form>
            </div>

        </div>

    </div>
</@layout.header>