<style>
    #assento{
        margin: 0;
        width: 100%;
        height: 100%;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    main{
        height: 30%;
        max-width: 80%;
        background-color: rgb(188, 188, 255);
        display: flex;
        flex-direction: column;
        overflow-x: auto;
    }

    .par{
        height: 50%;
        display: flex;
    }
    .impar{
        height: 50%;
        display: flex;
    }

    .assento{
        display: flex;
        justify-content: center;
        align-items: center;
        aspect-ratio: 1/1;
        background-color: rgb(188, 188, 255);

    }

    .disponivel{
        color: antiquewhite;
        font-weight: bolder;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: rgb(0, 102, 255);
        border: 1px solid black;
        width: 50%;
        height: 50%;
        display: flex;
        justify-content: center;
        align-items: center;
    }
</style>
<div id="assento">
    <main>
        <div class="impar"></div>
        <div class="par"></div>
    </main>
</div>
<script>
    const main = document.querySelector("main");
    const linhas = [document.querySelector(".par"), document.querySelector(".impar")];

    const url = "http://127.0.0.1:9081/assentos/10";
    const urlOcupacao = "http://127.0.0.1:9081/ocupacaoDoVoo/10";

    function funcao(elements){
        <#--elements.forEach(element => {-->
        <#--    //let { id_assento, id_aviao } = element;-->
        <#--    let assento = document.createElement("div");-->
        <#--    let numb = document.createElement("div");-->
        <#--    assento.className = "assento";-->
        <#--    numb.className = "disponivel";-->
        <#--    //numb.innerText = id_assento;-->
        <#--    //numb.id = `V${id_assento}`;-->
        <#--    assento.appendChild(numb);-->
        <#--    linhas[id_assento%2].appendChild(assento);-->
        });
    }

    function funcao2(elements){
        elements.forEach(element => {
            let { id_assento, id_aviao } = element;
            //document.querySelector(`#V${id_assento}`).style.background = "red";
        });
    }
    fetch(url)
        .then((respFetch) => respFetch.json())
        .then((respJson) => funcao(respJson))
        .catch((err) => console.log(err));
    fetch(urlOcupacao)
        .then((respFetch) => respFetch.json())
        .then((respJson) => funcao2(respJson))
        .catch((err) => console.log(err));
</script>