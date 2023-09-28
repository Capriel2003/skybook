<#-- @ftlvariable name="articles" type="kotlin.collections.List<com.example.models.Article>" -->
<#import "_layout.ftl" as layout />
<@layout.header>

    <div class="card" style="width: 18rem;">
        <img src="..." class="card-img-top" alt="...">
        <div class="card-body">
            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
        </div>
    </div>

    <div class="teste">
        Ola
    </div>

    <#list articles?reverse as article>
        <div>
            <h3>
                <a href="/articles/${article.id}">${article.title}</a>
            </h3>
            <p>
                ${article.body}
            </p>
        </div>
    </#list>
    <hr>
    <p>
        <a href="/articles/new">Create article</a>
    </p>
</@layout.header>