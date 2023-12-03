<#-- @ftlvariable name="article" type="com.example.models.Article" -->
<#import "_layoutcadastrado.ftl" as layout />
<@layout.header>

    <style>

        input[type="date"] {
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
            width: 200px;
            outline: none;
        }

        input[type="date"]:focus {
            border-color: #66afe9;
            box-shadow: 0 0 5px rgba(102, 175, 233, 1);
        }

        input[type="date"]:hover {
            cursor: pointer;
        }

        input[type="date"]::before {
            content: "📅";
            margin-right: 5px;
        }
    </style>
    <div>
        <div class="content">

            <object width="90%" height="90%" id="mapa" data="/static/files/mapa.svg" type="image/svg+xml" onload="setMapEvents()"></object>



            <div class="barra-pesquisa">
                <h2>Reserva de Voos</h2>

                <form action="/skybook/passagens" method="post">
                    <span>Origem</span>
                    <select onchange="validaPais(true)" id="origem" name="origem" required>
                        <option value="none">Selecione a Origem</option>
                        <option value="AC">Acre</option>
                        <option value="AL">Alagoas</option>
                        <option value="AM">Amazonas</option>
                        <option value="AP">Amapá</option>
                        <option value="BA">Bahia</option>
                        <option value="CE">Ceará</option>
                        <option value="DF">Distrito Federal</option>
                        <option value="ES">Espírito Santo</option>
                        <option value="GO">Goiás</option>
                        <option value="MA">Maranhão</option>
                        <option value="MG">Minas Gerais</option>
                        <option value="MS">Mato Grosso do Sul</option>
                        <option value="MT">Mato Grosso</option>
                        <option value="PA">Pará</option>
                        <option value="PB">Paraíba</option>
                        <option value="PE">Pernambuco</option>
                        <option value="PI">Piauí</option>
                        <option value="PR">Paraná</option>
                        <option value="RJ">Rio de Janeiro</option>
                        <option value="RN">Rio Grande do Norte</option>
                        <option value="RO">Rondônia</option>
                        <option value="RR">Roraima</option>
                        <option value="RS">Rio Grande do Sul</option>
                        <option value="SC">Santa Catarina</option>
                        <option value="SE">Sergipe</option>
                        <option value="SP">São Paulo</option>
                        <option value="TO">Tocantins</option>
                    </select>

                    <span>Destino</span>
                    <select onchange="validaPais(false)" id="destino" name="destino" required>
                        <option value="none">Selecione o Destino</option>
                        <option value="AC">Acre</option>
                        <option value="AL">Alagoas</option>
                        <option value="AM">Amazonas</option>
                        <option value="AP">Amapá</option>
                        <option value="BA">Bahia</option>
                        <option value="CE">Ceará</option>
                        <option value="DF">Distrito Federal</option>
                        <option value="ES">Espírito Santo</option>
                        <option value="GO">Goiás</option>
                        <option value="MA">Maranhão</option>
                        <option value="MG">Minas Gerais</option>
                        <option value="MS">Mato Grosso do Sul</option>
                        <option value="MT">Mato Grosso</option>
                        <option value="PA">Pará</option>
                        <option value="PB">Paraíba</option>
                        <option value="PE">Pernambuco</option>
                        <option value="PI">Piauí</option>
                        <option value="PR">Paraná</option>
                        <option value="RJ">Rio de Janeiro</option>
                        <option value="RN">Rio Grande do Norte</option>
                        <option value="RO">Rondônia</option>
                        <option value="RR">Roraima</option>
                        <option value="RS">Rio Grande do Sul</option>
                        <option value="SC">Santa Catarina</option>
                        <option value="SE">Sergipe</option>
                        <option value="SP">São Paulo</option>
                        <option value="TO">Tocantins</option>
                    </select>


                    <div>Data</div>
                    <input type="date" name="data" id="data" min = "" required>

                    <script>
                        date = new Date();
                        ano = date.getFullYear();
                        mes = date.getMonth() + 1;
                        dia = date.getDate();
                        data_hoje = ano + "-" + mes + "-" + dia;
                        console.log(data_hoje)
                        document.getElementById("data").min = data_hoje;
                    </script>
                    <button id="confirmar">Pesquisar</button>
                </form>
            </div>

        </div>

    </div>


</@layout.header>