<#-- @ftlvariable name="article" type="com.example.models.Article" -->
<#import "_layout.ftl" as layout />
<@layout.header>
    <style>
        #body {
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 91vh;
        }

        .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 82vh;
        }

        .airplane-layout,
        .airplane-layout2 {
            display: grid;
            grid-template-columns: repeat(10, 50px);
            grid-template-rows: repeat(2, 50px) repeat(2, 20px);
            grid-gap: 5px;
            margin-bottom: 20px;
            margin: 0 auto; /* Centraliza horizontalmente */
        }

        .seat {
            width: 50px;
            height: 50px;
            background-color: #bdc3c7;
            border: 1px solid #34495e;
            text-align: center;
            line-height: 50px;
            cursor: pointer;
            user-select: none; /* Evita seleção de texto ao clicar */
            transition: background-color 0.3s ease;
        }

        .seat.selected {
            background-color: #3498db;
            color: #fff;
        }

        .center-text {
            text-align: center;
            margin-bottom: 30px;
            font-size: 24px;
            font-weight: bold;
        }

        .reservation-button {
            display: block;
            margin: 0 auto;
            padding: 10px 20px;
            background-color: #3498db;
            color: #fff;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .reservation-button:hover {
            background-color: #2980b9;
        }


    </style>

<div id="body">
    <div class="container">
        <div class="center-text">
            Seleção de Assentos
        </div>

        <div class="airplane-layout">
            <!-- Assentos serão adicionados dinamicamente aqui -->
        </div>

        <div class="airplane-layout2">
            <!-- Assentos serão adicionados dinamicamente aqui -->
        </div>
        <form action="/skybook/informacoes" method="post">
            <button class="reservation-button" name="botao" id = "botao">Reservar Assentos</button>
        </form>
    </div>

</div>



<script>
    document.addEventListener("DOMContentLoaded", function () {
        const airplaneLayout1 = document.querySelector(".airplane-layout");

        // Número de linhas e colunas no layout do avião
        const rows = 2;
        const cols = 10;
        var cont = 1;

        // Adiciona assentos dinamicamente ao layout
        for (let row = 1; row <= rows; row++) {
            for (let col = 1; col <= cols; col++) {
                const seat = document.createElement("div");
                seat.classList.add("seat");
                seat.dataset.row = row;
                seat.dataset.col = col;
                seat.textContent = cont.toString();
                cont++;
                seat.addEventListener("click", toggleSeatSelection);
                airplaneLayout1.appendChild(seat);
            }
        }
    });

    document.addEventListener("DOMContentLoaded", function () {
        const airplaneLayout2 = document.querySelector(".airplane-layout2");

        // Número de linhas e colunas no layout do avião
        const rows = 2;
        const cols = 10;
        var cont = 21;

        // Adiciona assentos dinamicamente ao layout
        for (let row = 1; row <= rows; row++) {
            for (let col = 1; col <= cols; col++) {
                const seat = document.createElement("div");
                seat.classList.add("seat");
                seat.dataset.row = row;
                seat.dataset.col = col;
                seat.textContent = cont.toString();
                cont++;
                seat.addEventListener("click", toggleSeatSelection);
                airplaneLayout2.appendChild(seat);
            }
        }
    });

    function toggleSeatSelection() {
        // Desmarca todos os assentos selecionados
        const selectedSeats = document.querySelectorAll('.seat.selected');
        selectedSeats.forEach(selectedSeat => selectedSeat.classList.remove('selected'));
        this.classList.add("selected");
        document.getElementById("botao").value = this.textContent;

    }

</script>


</@layout.header>