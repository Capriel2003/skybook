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
    var pdf = new jsPDF({
      orientation: 'p',
      unit: 'mm',
      format: 'a5',
      putOnlyUsedFonts: true
    });

    // Adiciona o título do ticket
    pdf.setFontSize(20);
    pdf.setTextColor(41, 128, 185); // Cor azul
    pdf.setFontStyle('bold');
    pdf.text("Ticket Voo", 20,30, { align: 'center' });

    // Adiciona os detalhes da passagem
    pdf.setFontSize(14);
    pdf.setTextColor(44, 62, 80); // Cor escura
    pdf.setFontStyle('normal');


    pdf.text(`
      Nome: ${passagem.nome} \n
      Email: ${passagem.email}\n
      Telefone: ${passagem.telefone}\n
      Assento: ${passagem.assento}\n
      Origem: ${passagem.origem}\n
      Destino: ${passagem.destino}\n
      Data: ${passagem.data} \t\t Hora: ${passagem.hora}\n
      Preço: R$ ${passagem.preco},99\n
    `,25,50, { align: 'center' });

    pdf.save('reciboVoo.pdf');
  }
</script>

<div id="main">
<div class="container">
  <h1>Baixe o seu ticket de viagem</h1>
  <button onclick="generatePDF()">Baixar Ticket</button>
</div>
</div>

</@layout.header>
