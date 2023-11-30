<#-- @ftlvariable name="cadastros" type="kotlin.collections.List<com.example.models.Cadastro>" -->
<#import "_layout.ftl" as layout />
<@layout.header>

    <#list cadastros?reverse as cadastros>
            <div>
                <h3>
                   ${cadastros.nome}
                </h3>
                <p>
                    ${cadastros.email}
                    ${cadastros.senha}
                </p>
            </div>
    </#list>

</@layout.header>

