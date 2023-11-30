<#-- @ftlvariable name="article" type="com.example.models.Article" -->
<#import "_layout.ftl" as layout />
<@layout.header>
    <div class="body-log">
        <div class="login">
            <h2 class="top-log">Cadastre-se</h2>

            <div class="barra-login" >
                <form action="/articles" method="post">
                    <label for="email">Email:</label>
                    <input type="text" id="email" name="title" required>

                    <label for="senha">Senha:</label>
                    <input type="password" id="senha" name="body" required>

                    <button type="submit" class = "botao-log">Cadastrar</button>




                </form>
            </div>
        </div>

    </div>
</@layout.header>