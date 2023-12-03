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
                        <label for="assento">Selecione seu assento:</label>
                        <select id="assento" name="assento" required="required">
                            <option value="none">Selecione</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>
                            <option value="8">8</option>
                            <option value="9">9</option>
                            <option value="10">10</option>
                            <option value="11">11</option>
                            <option value="12">12</option>
                            <option value="13">13</option>
                            <option value="14">14</option>
                            <option value="15">15</option>
                            <option value="16">16</option>
                            <option value="17">17</option>
                            <option value="18">18</option>
                            <option value="19">19</option>
                            <option value="20">20</option>
                            <option value="21">21</option>
                            <option value="22">22</option>
                            <option value="23">23</option>
                            <option value="24">24</option>
                            <option value="25">25</option>
                            <option value="26">26</option>
                            <option value="27">27</option>
                            <option value="28">28</option>
                            <option value="29">29</option>
                            <option value="30">30</option>

                        </select>
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