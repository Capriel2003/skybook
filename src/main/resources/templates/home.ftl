<#-- @ftlvariable name="article" type="com.example.models.Article" -->
<#import "_layout.ftl" as layout />
<@layout.header>
    <div>
        <div class="content">

            <object id="mapa" data="/static/files/map.svg" type="image/svg+xml" onload="setMapEvents()"></object>



            <div class="barra-pesquisa">
                <h2>Reserva de Voos</h2>

                <form>
                    <span>Origem</span>
                    <select onchange="validaPais(true)" id="origem" name="origem">
                        <option value="none" selected disabled hidden>Selecione uma opção</option>
                        <option value="africa">África</option>
                        <option value="america">America</option>
                        <option value="mato">Mato Grosso</option>
                        <option value="minas">Minas Gerais</option>
                        <option value="pascoa">Páscoa</option>
                        <option value="nlogonia">Nlogonia</option>
                        <option value="tocantins">Tocantins</option>
                    </select>

                    <span>Destino</span>
                    <select onchange="validaPais(false)" id="destino" name="destino">
                        <option value="none" selected disabled hidden>Selecione uma opção</option>
                        <option value="africa">África</option>
                        <option value="america">America</option>
                        <option value="mato">Mato Grosso</option>
                        <option value="minas">Minas Gerais</option>
                        <option value="pascoa">Páscoa</option>
                        <option value="nlogonia">Nlogonia</option>
                        <option value="tocantins">Tocantins</option>
                    </select>

                    <div>Data</div>
                    <input type="date" name="date" id="data">
                    <button id="confirmar">Pesquisar</button>
                </form>
            </div>

        </div>

    </div>
</@layout.header>