<#import "_layoutcadastrado.ftl" as layout />
<@layout.header>

    <div id="info-pessoa">
        <h3 style="color: #ffffff"><b>Vamos agora reservar sua passagem!!</b></h3>

        <div class="row" style="padding-top: 10px">
            <div class="columnTXT" style="background-color: #f2f2f2; border-radius: 10px;">
                <div class="box" >
                    <h3>Informações do passageiro</h3>
                    <h5>Insira aqui as infomaçõesde quem vai estar a bordo!</h5>

                    <hr />
                    <form action="/skybook/pagamento" method="post">
                        <label for="fname">Nome completo</label>
                        <input
                                type="text"
                                class="text"
                                id="fname"
                                name="nome"
                                value="${passagem.nome}"
                                required="required"
                        />
                        <label for="cpf">CPF:</label>
                        <input
                                type="text"
                                class="text"
                                id="cpf"
                                name="cpf"
                                pattern="\d{3}\.\d{3}\.\d{3}-\d{2}"
                                placeholder="123.456.789-01"
                                required
                        />
                        <label for="e-mail">E-mail</label>
                        <input
                                type="email"
                                class="text"
                                pattern="[a-z0-9._%+\-]+@[a-z0-9.\-]+\.[a-z]{2,}$"
                                id="email"
                                name="email"
                                value="${passagem.email}"
                                title="Um indereço de E-mail válido é semelhante a vamosvoarem312@decolando.com"
                                required="required"
                        />

                        <label for="phone">Telefone </label>
                        <input
                                type="text"
                                class="text"
                                id="phone"
                                name="telefone"
                                placeholder="(99) 9999-9999"
                                pattern="(\([0-9]{2}\))\s([9]{1})?([0-9]{4})-([0-9]{4})"
                                title="Número de telefone precisa ser no formato (99) 9999-9999"
                                required="required"
                        />
                        <input type="submit" value="Prosseguir">
                    </form>
                </div>
                <br />
            </div>


            <div class="columnRevisao" style="padding-top: 35px; margin-top: 50px; background-color: #f2f2f2; border-radius: 10px;">
                <div class="box" >
                    <h3>Resumo da viagem</h3>
                    <hr>
                    <h5> Horário Saída --------------  Destino  </h5>
                    <h5> ${passagem.hora} São Paulo -------------- Goiania </h5>
                    <h5>Em <b> ${passagem.data} </b> </h5>
                </div>
                <br>
                <hr>

                <div class="box" >
                    <h3>Resumo do pedido</h3>
                    <hr>
                    <h5> Assento ${passagem.assento} -------------- <b>R$ ${passagem.preco} </b> </h5>

                    <label for="cupom">Insira aqui seu cupom de desconto</label>
                    <input
                            type="text"
                            id="cupom"
                            name="cupom"
                            placeholder="Exemplo: V14JAR"
                    />

                    <input type="submit" value="Submit">
                </div>

            </div>
        </div>
    </div>
</@layout.header>