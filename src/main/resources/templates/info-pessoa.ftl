<#import "_layoutcadastrado.ftl" as layout />
<@layout.header>

    <div id="info-pessoa">
        <h3>Vamos agora reservar sua passagem!!</h3>

        <div class="row" style="padding-top: 10px">
            <div class="columnTXT">
                <div class="box">
                    <h3>Informações do passageiro</h3>
                    <h5>Insira aqui as infomaçõesde quem vai estar a bordo!</h5>

                    <hr />
                    <form  action="/skybook/pagamento" method="post">
                        <label>Nome completo</label>
                        <input
                                type="text"
                                class="text"
                                id="fname"
                                name="fname"
                                value="${pessoa.nome}"
                                required="required"
                        />

                        <label>E-mail</label>

                        <input
                                type="email"
                                class="text"
                                pattern="[a-z0-9._%+\-]+@[a-z0-9.\-]+\.[a-z]{2,}$"
                                id="email"
                                name="email"
                                value="${pessoa.email}"
                                title="Um indereço de E-mail válido é semelhante a vamosvoarem312@decolando.com"
                                required="required"
                        />

                        <label>Telefone </label>
                        <input
                                type="text"
                                class="text"
                                id="phone"
                                name="phone"
                                placeholder="(99) 9999-9999"
                                pattern="(\([0-9]{2}\))\s([9]{1})?([0-9]{4})-([0-9]{4})"
                                title="Número de telefone precisa ser no formato (99) 9999-9999"
                                required="required"
                        />
                        <br>
                        <input type="submit" value="Prosseguir">
                    </form>
                </div>
                <br />
            </div>


            <div class="columnRevisao" style="padding-top: 20px">
                <div class="box">
                    <h3>Resumo da viagem</h3>
                    <hr>
                    <h5> Horário Saída --------------  Destino  </h5>
                    <h5> 07:00 São Paulo -------------- Goiania </h5>
                    <h5>Em <b>DATA VIAGEM</b> </h5>
                </div>
                <br>
                <div class="box">
                    <h3>Resumo do pedido</h3>
                    <hr>
                    <h5> 01 Assento -------------- <b>R$ PRECO PASSAGEM</b> </h5>

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