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

var passagem = Passagem("", "", "", "", "", "", "", "",0.0, 0, false)

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
                    passagem.email = email
                    pessoa.senha = senha
                    call.respond(FreeMarkerContent("homecadastrado.ftl", mapOf("passagem" to passagem)))
                }
                call.respond(FreeMarkerContent("home.ftl", model = null))
            }
            get("new") {
                call.respond(FreeMarkerContent("new.ftl", model = null))
            }
            post {
                val formParameters = call.receiveParameters()
                val title = formParameters.getOrFail("title")
                val body = formParameters.getOrFail("body")
                val newEntry = Article.newEntry(title, body)
                articles.add(newEntry)
                call.respondRedirect("/skybook/${newEntry.id}")
            }
            get("{id}") {
                val id = call.parameters.getOrFail<Int>("id").toInt()
                call.respond(FreeMarkerContent("show.ftl", mapOf("article" to articles.find { it.id == id })))
            }
            get("{id}/edit") {
                val id = call.parameters.getOrFail<Int>("id").toInt()
                call.respond(FreeMarkerContent("edit.ftl", mapOf("article" to articles.find { it.id == id })))
            }
            post("{id}") {
                val id = call.parameters.getOrFail<Int>("id").toInt()
                val formParameters = call.receiveParameters()
                when (formParameters.getOrFail("_action")) {
                    "update" -> {
                        val index = articles.indexOf(articles.find { it.id == id })
                        val title = formParameters.getOrFail("title")
                        val body = formParameters.getOrFail("body")
                        articles[index].title = title
                        articles[index].body = body
                        call.respondRedirect("/skybook/$id")
                    }
                    "delete" -> {
                        articles.removeIf { it.id == id }
                        call.respondRedirect("/skybook")
                    }
                }
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
                    passagem.email = userInfo[1]
                    pessoa.senha = userInfo[2]
                    call.respond(FreeMarkerContent("homecadastrado.ftl", mapOf("pessoa" to pessoa)))
                }
                call.respond(FreeMarkerContent("home.ftl", mapOf("articles" to articles)))
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
                    call.respond(FreeMarkerContent("info-pessoacadastrada.ftl", mapOf("passagem" to passagem,
                        "pessoa" to pessoa
                    )))
                }
                call.respond(FreeMarkerContent("info-pessoa.ftl", mapOf("passagem" to passagem,
                    "pessoa" to pessoa
                )))
            }
            post("informacoes"){

                    val formParameters = call.receiveParameters()
                    val botao = formParameters["botao"]?.split(".")?.joinToString("")
                    val vooSelecionado = listaVoos.find{ it.index == botao?.toInt() }
                    val compania = vooSelecionado?.compania.toString()
                    val preco = vooSelecionado?.preco

                    passagem.compania = compania
                    if (preco != null) {
                        passagem.preco = preco
                    }
                    call.respondRedirect("/skybook/informacoes")

//                if (userDataCookie != null && userDataCookie!="false") {
//                    call.respond(FreeMarkerContent("passagenscadastrada.ftl",
//                        mapOf("voos" to listaVoos.filter { it.origem == solicitacao.origem && it.destino == solicitacao.destino},
//                            "data" to solicitacao.data,
//                            "passagem" to passagem
//                        )))
//                }
//                call.respond(FreeMarkerContent("passagens.ftl",
//                    mapOf("voos" to listaVoos.filter { it.origem == solicitacao.origem && it.destino == solicitacao.destino},
//                        "data" to solicitacao.data
//                    )))

            }

            get("pagamento"){
                call.respond(FreeMarkerContent("pagamento.ftl", mapOf("passagem" to passagem)))
            }
            post("pagamento"){
                val formParameters = call.receiveParameters()
                passagem.nome = formParameters.getOrFail("nome")
                passagem.email = formParameters.getOrFail("email")
                passagem.telefone = formParameters.getOrFail("telefone")
                passagem.assento = (formParameters.getOrFail("assento")).toInt()

                application.log.info(passagem.assento.toString())
                application.log.info("zzz")
                application.log.info(passagem.origem)

                call.respondRedirect("pagamento")
            }
            post("recibo") {
                passagem.pagamento = true
                call.respondRedirect("/skybook/recibo")
            }
            get("recibo"){
                call.respond(FreeMarkerContent("print.ftl", mapOf("passagem" to passagem)))
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
                            "passagem" to passagem
                        )))
                }
                call.respond(FreeMarkerContent("passagens.ftl",
                    mapOf("voos" to listaVoos.filter { it.origem == solicitacao.origem && it.destino == solicitacao.destino},
                        "data" to solicitacao.data
                    )))
            }
        }
    }
}