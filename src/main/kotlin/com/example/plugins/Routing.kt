package com.example.plugins

import com.example.models.*
import io.ktor.http.*
import io.ktor.server.application.*
import io.ktor.server.freemarker.*
import io.ktor.server.http.content.*
import io.ktor.server.request.*
import io.ktor.server.response.*
import io.ktor.server.routing.*
import io.ktor.server.util.*

val range = listaVoos.size
var data = (5..30).random().toString() + "/12/2023"
val promocoes: List<Int> = listOf((0..range).random(), (0..range).random(), (0..range).random(), (0..range).random(), (0..range).random(), (0..range).random())
var passagem = Passagem("", "", "", "", "", "Acre", "", data, "",0.0, 0, false)

fun Application.configureRouting() {
    routing {
        static("/static") {
            resources("templates")
        }
        get("/") {
            call.respondRedirect("skybook")
        }

        route("skybook") {
            get {
                val userDataCookie = call.request.cookies["userData"]
                if (userDataCookie != null && userDataCookie!="false") {
                    val userInfo = userDataCookie.split(":")
                    val nome = userInfo[0]
                    val email = userInfo[1]
                    val senha = userInfo[2]
                    passagem.nome = nome
                    pessoa.nome = nome
                    passagem.email = email
                    pessoa.senha = senha
                    call.respond(FreeMarkerContent("homecadastrado.ftl", mapOf("passagem" to passagem,
                        "pessoa" to pessoa
                    )))
                }
                call.respond(FreeMarkerContent("home.ftl", model = null))
            }
            get("new") {
                call.respond(FreeMarkerContent("new.ftl", model = null))
            }

            get("login"){
                call.respond(FreeMarkerContent("login.ftl", model=null))
            }
            get("loginErro"){
                call.respond(FreeMarkerContent("loginErro.ftl", model=null))
            }
            post("login"){
                val formParameters = call.receiveParameters()
                val email = formParameters.getOrFail("email")
                val senha = formParameters.getOrFail("senha")
                val dados = getCadastroByEmail(email)
                if (dados?.senha == senha){
                    call.response.cookies.append("userData","${dados.nome}:${dados.email}:${dados.senha}")
                    call.respondRedirect("/skybook")
                }
                else{
                    call.respondRedirect("/skybook/loginErro")
                }
            }

            get("lisCad"){
                call.respond(FreeMarkerContent("mapacadasatro.ftl", mapOf("cadastros" to cadastros)))            }
            get("cadastros"){
                call.respond(FreeMarkerContent("cadastro.ftl", model = null))
            }
            post("cadastros"){
                val formParameters = call.receiveParameters()
                val nome = formParameters.getOrFail("nome")
                val email = formParameters.getOrFail("email")
                val senha = formParameters.getOrFail("senha")
                val novosDados = Cadastro.newEntry(nome, email, senha)
                cadastros.add(novosDados)

                call.response.cookies.append("userData","${novosDados.nome}:${novosDados.email}:${novosDados.senha}")

                call.respondRedirect("/skybook")
            }
            get("cadastros/{id}"){
                val id = call.parameters.getOrFail<Int>("id").toInt()
                call.respond(FreeMarkerContent("listacadastro.ftl", mapOf("cadastros" to cadastros)))
            }
            get("home"){
                val userDataCookie = call.request.cookies["userData"]
                if (userDataCookie == "false"){
                }
                if (userDataCookie != null && userDataCookie != "false") {
                    val userInfo = userDataCookie.split(":")
                    passagem.nome = userInfo[0]
                    pessoa.nome = userInfo[0]
                    passagem.email = userInfo[1]
                    pessoa.senha = userInfo[2]
                    call.respond(FreeMarkerContent("homecadastrado.ftl", mapOf("pessoa" to pessoa)))
                }
                call.respond(FreeMarkerContent("home.ftl", model = null))
            }

            post("logout") {
                call.response.cookies.append(
                    name = "userData", // Novo nome do cookie
                    value = "false"
                )
                call.respond(HttpStatusCode.OK, "Usuário deslogado com sucesso.")
            }


            get("informacoes"){
                val userDataCookie = call.request.cookies["userData"]
                if (userDataCookie != null && userDataCookie!="false") {
                    call.respond(FreeMarkerContent("info-pessoa.ftl", mapOf("passagem" to passagem,
                        "pessoa" to pessoa
                    )))
                }
                call.respondRedirect("/skybook/cadastros")
            }
            post("informacoes"){
                val formParameters = call.receiveParameters()
                val botao = formParameters["botao"]?.toInt()
                if (botao != null) {
                    passagem.assento = botao
                }
                call.respondRedirect("/skybook/informacoes")
            }

            get("assentos"){
                val userDataCookie = call.request.cookies["userData"]
                if (userDataCookie != null && userDataCookie!="false") {
                    call.respond(FreeMarkerContent("assentoscadastrado.ftl", mapOf("passagem" to passagem,
                        "pessoa" to pessoa
                    )))
                }
                call.respond(FreeMarkerContent("assentos.ftl", model = null))
            }

            post("assentos"){
                val formParameters = call.receiveParameters()
                val botao = formParameters["botao"]?.split(".")?.joinToString("")
                val vooSelecionado = listaVoos.find{ it.index == botao?.toInt() }
                val compania = vooSelecionado?.compania.toString()
                val preco = vooSelecionado?.preco
                val hora = vooSelecionado?.hora.toString()

                passagem.hora = hora
                passagem.companhia = compania
                if (preco != null) {
                    passagem.preco = preco
                }
                call.respondRedirect("/skybook/assentos")
            }

            get("pagamento"){
                call.respond(FreeMarkerContent("pagamento.ftl", mapOf("passagem" to passagem,
                    "pessoa" to pessoa
                )))
            }
            post("pagamento"){
                val formParameters = call.receiveParameters()
                passagem.nome = formParameters.getOrFail("nome")
                passagem.email = formParameters.getOrFail("email")
                passagem.telefone = formParameters.getOrFail("telefone")
                passagem.cpf = formParameters.getOrFail("cpf")
                application.log.info("zzz")
                application.log.info(passagem.cpf)

                call.respondRedirect("pagamento")
            }
            post("recibo") {
                passagem.pagamento = true
                call.respondRedirect("/skybook/recibo")
            }
            get("recibo"){
                call.respond(FreeMarkerContent("print.ftl", mapOf("passagem" to passagem,
                    "pessoa" to pessoa
                )))
            }
            post("passagens") {
                val formParameters = call.receiveParameters()
                val solicitacao = Solicitacao(formParameters.getOrFail("origem"), formParameters.getOrFail("destino"), formParameters.getOrFail("data"))
                passagem.data = solicitacao.data
                passagem.origem = solicitacao.origem
                passagem.destino = solicitacao.destino

                val userDataCookie = call.request.cookies["userData"]
                if (userDataCookie != null && userDataCookie!="false") {
                    call.respond(FreeMarkerContent("passagenscadastrada.ftl",
                        mapOf("voos" to listaVoos.filter { it.origem == solicitacao.origem && it.destino == solicitacao.destino},
                            "data" to solicitacao.data,
                            "passagem" to passagem,
                            "pessoa" to pessoa
                        )))
                }
                call.respond(FreeMarkerContent("passagens.ftl",
                    mapOf("voos" to listaVoos.filter { it.origem == solicitacao.origem && it.destino == solicitacao.destino},
                        "data" to solicitacao.data
                    )))
            }
            get("promocao") {
                var pagina = "promocao.ftl"
                val userDataCookie = call.request.cookies["userData"]
                if (userDataCookie != null && userDataCookie!="false") {
                    pagina = "promocaocadastrado.ftl"
                }




                if(passagem.origem == "")
                call.respond(FreeMarkerContent(pagina,
                    mapOf("passagem" to passagem,
                        "voos" to listaVoos,
                        "promocoes" to promocoes,
                        "pessoa" to pessoa
                    )))
                else {
                    application.log.info("zzz")
                    val passagensOrigem = listaVoos.filter { it.origem == passagem.origem}
                    application.log.info("criou lista")
                    val rangeOrigem = passagensOrigem.size
                    application.log.info("de tamanho " + rangeOrigem)
                    val promocoes_especificas: List<Int> = listOf(passagensOrigem[(0..rangeOrigem).random()].index, passagensOrigem[(0..rangeOrigem).random()].index, passagensOrigem[(0..rangeOrigem).random()].index, passagensOrigem[(0..rangeOrigem).random()].index, passagensOrigem[(0..rangeOrigem).random()].index, passagensOrigem[(0..rangeOrigem).random()].index)
                    val horas: List<Int> = listOf((0..23).random(), (0..23).random(), (0..23).random(), (0..23).random(), (0..23).random(), (0..23).random())
                    val datas: List<String> = listOf((5..30).random().toString() + "/12/2023", (5..30).random().toString() + "/12/2023", (5..30).random().toString() + "/12/2023", (5..30).random().toString() + "/12/2023", (5..30).random().toString() + "/12/2023", (5..30).random().toString() + "/12/2023")
                    application.log.info("promoçoes selecionaddas " + promocoes_especificas[0])
                    call.respond(FreeMarkerContent(pagina,
                        mapOf("passagem" to passagem,
                            "pessoa" to pessoa,
                            "voos" to listaVoos,
                            "promocoes" to promocoes_especificas,
                            "horas" to horas,
                            "datas" to datas
                        )))
                }
            }
        }
    }
}