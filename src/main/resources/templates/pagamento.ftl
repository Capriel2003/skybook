<#import "_layoutcadastrado.ftl" as layout/>
<@layout.header>
    <style>
        #pagamento{
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0;
        }

        .pagamento {
            width: 300px;
            text-align: center;
        }

        .pagamento-header {
            margin-bottom: 40px; /* Aumentado o espaço entre o título e os elementos abaixo */
        }

        .pagamento-title {
            margin: 20px 0; /* Aumentado o espaço inferior do título */
        }

        .pagamento-logos {
            display: flex;
            justify-content: center;
            margin-bottom: 10px;
        }

        .pagamento-logo {
            width: 30px; /* Tamanho ajustado para 30px */
            margin: 0 10px; /* Espaçamento ajustado para 10px */
        }

        .pagamento-input {
            width: calc(100% - 20px);
            padding: 8px;
            margin-bottom: 10px;
            box-sizing: border-box;
        }

        .pagamento-btn {
            padding: 10px;
            border: none;
            width: 100%;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .pagamento-btn:disabled {
            background-color: #808080;
        }

        .pagamento-btn.enabled {
            background-color: #4CAF50;
        }

        .pagamento-exp {
            width: calc((100% - 28px) / 2);
        }
    </style>
    <div id="pagamento">
        <form class="pagamento" onsubmit="return validarCartao()">
            <div class="pagamento-header">
                <h1 class="pagamento-title">
                    Pagamento
                    <span class="pagamento-price"></span>
                </h1>
                <div class="pagamento-logos">
                    <img class="pagamento-logo" src="https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/Old_Visa_Logo.svg/2560px-Old_Visa_Logo.svg.png" alt="Visa Logo">
                    <img class="pagamento-logo" src="https://i0.wp.com/assets.b9.com.br/wp-content/uploads/2019/01/mastercard-2019.jpg?fit=1280%2C720&ssl=1" alt="Mastercard Logo">
                    <img class="pagamento-logo" src="https://torp.ind.br/wp-content/uploads/2020/09/elo-logo-1.png" alt="Elo Logo">
                    <img class="pagamento-logo" src="https://www.dafontfree.io/wp-content/uploads/2023/11/amex-logo.png" alt="America Express Logo">
                </div>
            </div>
            <input type="text" class="pagamento-input pagamento-name" placeholder="Digite o nome impresso no cartão" oninput="transformarMaiusculas(this)">
            <input type="text" class="pagamento-input pagamento-exp" placeholder="MM" maxlength="2" oninput="limitarMM(this)">
            <input type="text" class="pagamento-input pagamento-exp" placeholder="YY" maxlength="2" oninput="limitarYY(this)">
            <input type="text" class="pagamento-input pagamento-card" placeholder="Digite somente números" oninput="limitarNumeroCartao(); formatarNumeroCartao(); validarNumeroCartao()">
            <input type="text" class="pagamento-input pagamento-cvc" placeholder="CVV" maxlength="3" oninput="limitarCVV(this)">
            <label for="parcelamento">Parcelamento:</label>
            <select id="parcelamento" name="parcelamento" class="pagamento-input">
                <option value="1">1x sem juros</option>
                <option value="2">2x sem juros</option>
                <option value="3">3x sem juros</option>
                <option value="4">4x sem juros</option>
                <option value="5">5x sem juros</option>
            </select>
            <input type="submit" value="Comprar" class="pagamento-btn" id="comprarBtn" disabled>
        </form>
    </div>

    <script>
        function formatarNumeroCartao() {
            var cartaoInput = document.querySelector('.pagamento-card');
            var numeroCartao = cartaoInput.value.replace(/\D/g, '');
            var numeroFormatado = numeroCartao.replace(/(\d{4})/g, '$1 ');
            cartaoInput.value = numeroFormatado.trim();
        }

        function validarNumeroCartao() {
            var cartaoInput = document.querySelector('.pagamento-card');
            var comprarBtn = document.getElementById('comprarBtn');
            var numeroCartao = cartaoInput.value.replace(/\D/g, '');

            if (numeroCartao.length === 16) {
                comprarBtn.classList.add('enabled');
                comprarBtn.removeAttribute('disabled');
            } else {
                comprarBtn.classList.remove('enabled');
                comprarBtn.setAttribute('disabled', 'true');
            }
        }

        function transformarMaiusculas(elemento) {
            elemento.value = elemento.value.toUpperCase();
        }

        function limitarCVV(elemento) {
            elemento.value = elemento.value.replace(/\D/g, '').substr(0, 3);
        }

        function limitarNumeroCartao() {
            var cartaoInput = document.querySelector('.pagamento-card');
            cartaoInput.value = cartaoInput.value.replace(/\D/g, '').substr(0, 16);
        }

        function limitarMM(elemento) {
            elemento.value = elemento.value.replace(/\D/g, '').substr(0, 2);
        }

        function limitarYY(elemento) {
            elemento.value = elemento.value.replace(/\D/g, '').substr(0, 2);
        }

        function validarCartao() {
            return true;
        }
    </script>

</@layout.header>