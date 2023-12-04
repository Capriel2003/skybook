<#-- @ftlvariable name="voos" type="com.example.models.Voos" -->
<#import "_layout.ftl" as layout />
<@layout.header>
    <div class="body-log">
        <div class="login">
            <h2 class="top-log">Cadastre-se</h2>

            <#list voos?reverse as voos>
                <div>
                    <h3>
                        <a href="/voos">${article.title}</a>
                    </h3>
                    <p>
                        ${voos.body}
                    </p>
                </div>
            </#list>
        </div>
    </div>
</@layout.header>