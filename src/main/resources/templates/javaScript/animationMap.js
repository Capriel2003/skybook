const inputOrigem = document.querySelector("#origem");
const inputDestino = document.querySelector("#destino");
const packageOptions = document.querySelector("#pacotes");

var origem = null;
var destino = null;

//Essa aplicacao eh ficticia e nao esta de acordo com a realidade
const paises = {
    AC:{nome: "Acre",},
    AL:{nome: "Alagoas",},
    AM:{nome: "Amazonas",},
    AP:{nome: "Amapá",},
    BA:{nome: "Bahia",},
    CE:{nome: "Ceará",},
    DF:{nome: "Distrito Federal",},
    ES:{nome: "Espírito Santo",},
    GO:{nome: "Goiás",},
    MA:{nome: "Maranhão",},
    MG:{nome: "Minas Gerais",},
    MS:{nome: "Mato Grosso do Sul",},
    MT:{nome: "Mato Grosso",},
    PA:{nome: "Pará",},
    PB:{nome: "Paraíba",},
    PE:{nome: "Pernambuco",},
    PI:{nome: "Piauí",},
    PR:{nome: "Paraná",},
    RJ:{nome: "Rio de Janeiro",},
    RN:{nome: "Rio Grande do Norte",},
    RO:{nome: "Rondônia",},
    RR:{nome: "Roraima",},
    RS:{nome: "Rio Grande do Sul",},
    SC:{nome: "Santa Catarina",},
    SE:{nome: "Sergipe",},
    SP:{nome: "São Paulo",},
    TO:{nome: "Tocantins",},
};


//funcoes que mudam os paises selecionado
function changeOrigin(element, color, value, origin) {
    element.setAttribute("fill", color);
    inputOrigem.value = value;
    origem = origin;
}

function changeDestiny(element, color, value, destiny) {
    element.setAttribute("fill", color);
    inputDestino.value = value;
    destino = destiny;
}

/*
funcao que atribui eventos aos paises
e adiciona o html ao JSON dos paises
*/
function setMapEvents() {
    let list = document
        .querySelector(`object`)
        .contentDocument.querySelectorAll("path");
    list.forEach((element) => {
        paises[element.id]["html"] = element;
        element.addEventListener("click", () => {
            if (origem == null && destino != element.id) {
                changeOrigin(element, "red", element.id, element.id);
            } else if (destino == null && origem != element.id) {
                changeDestiny(element, "blue", element.id, element.id);
            } else {
                if (destino == element.id) {
                    changeDestiny(element, "#ffffff", "none", null);
                } else if (origem == element.id) {
                    changeOrigin(element, "#ffffff", "none", null);
                }
            }
        });
    });
}

//funcao para quando um pais for selecionado ao clicar
function validaPais(ehAOrigem) {
    if (ehAOrigem) {
        if (origem == null && inputOrigem.value != destino) {
            paises[inputOrigem.value]["html"].setAttribute("fill", "red");
            origem = inputOrigem.value;
        } else if (inputOrigem.value == destino) {
            inputOrigem.value = origem;
        } else {
            paises[origem]["html"].setAttribute("fill", "#ffffff");
            paises[inputOrigem.value]["html"].setAttribute("fill", "red");
            origem = inputOrigem.value;
        }
    }
    else if (destino == null && inputDestino.value != origem) {
        paises[inputDestino.value]["html"].setAttribute("fill", "blue");
        destino = inputDestino.value;
    }
    else if (inputDestino.value == origem) {
        inputDestino.value = destino;
    }
    else {
        paises[destino]["html"].setAttribute("fill", "#ffffff");
        paises[inputDestino.value]["html"].setAttribute("fill", "blue");
        destino = inputDestino.value;
    }
}

//Adicionar caracteristica de scroll nos pacotes
if (packageOptions != null) {
    packageOptions.addEventListener("wheel", (event) => {
        event.preventDefault();
        packageOptions.scrollBy({
            left: event.deltaY < 0 ? -30 : 30,
        });
    });
}