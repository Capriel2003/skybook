

function setLocal() {
    var nome = document.getElementById('fname').value;
    var email = document.getElementById('email').value;
    console.log('Parâmetro 1:', id);
    console.log('Parâmetro 2:', email);

}


function desaparecerOpcoes() {
    var display = document.getElementById("sumir1").style.display;
    if(display == "none")
        document.getElementById("sumir1").style.display = 'block';
    else
        document.getElementById("sumir1").style.display = 'none';
}

