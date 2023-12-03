<#import "_layoutcadastrado.ftl" as layout/>
<@layout.header>
  <style>
    #main {
      font-family: 'Arial', sans-serif;
      display: flex;
      align-items: center;
      justify-content: center;
      height: 91vh;
      margin: 0;
      background-color: #f4f4f4;
    }

    .container {
      text-align: center;
      background-color: #fff;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    h1 {
      color: #333;
    }

    button {
      padding: 10px 20px;
      font-size: 16px;
      background-color: #007bff;
      color: #fff;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }

    button:hover {
      background-color: #0056b3;
    }
  </style>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.0.272/jspdf.debug.js"></script>
  <script>
    function generatePDF() {
      // Supondo que você tenha um objeto 'passagem' com um atributo 'nome'
      var passagem = { nome: "Seu Nome" };

      var pdf = new jsPDF({
        orientation: 'p',
        unit: 'mm',
        format: 'a5',
        putOnlyUsedFonts:true
      });
      pdf.text(`Ticket Voo\n
      Nome: ${passagem.nome} \n
      ${passagem.email} \n
      ${passagem.telefone}\n
      ${passagem.assento} \n
      ${passagem.origem} \n
      ${passagem.destino} \n
      ${passagem.preco}`, 10, 20);
      pdf.save('reciboVoo.pdf');
    }
  </script>

<body>
<div id="main">
<div class="container">
  <h1>Baixe o seu ticket de viagem</h1>
  <button onclick="generatePDF()">Baixar Ticket</button>
</div>
</div>

</@layout.header>
