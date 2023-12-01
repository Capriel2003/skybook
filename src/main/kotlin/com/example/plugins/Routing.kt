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
                    pessoa.nome = nome
                    pessoa.email = email
                    pessoa.senha = senha
                    call.respond(FreeMarkerContent("homecadastrado.ftl", mapOf("pessoa" to pessoa)))
                }
                call.respond(FreeMarkerContent("index.ftl", mapOf("articles" to articles)))
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
                    application.log.info("logado")
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
                application.log.info(novosDados.id.toString())

                call.response.cookies.append("userData","${novosDados.nome}:${novosDados.email}:${novosDados.senha}")
                application.log.info("cadastrado")

                call.respondRedirect("/skybook")
            }
            get("cadastros/{id}"){
                val id = call.parameters.getOrFail<Int>("id").toInt()
                call.respond(FreeMarkerContent("listacadastro.ftl", mapOf("cadastros" to cadastros)))
            }
            get("home"){
                val userDataCookie = call.request.cookies["userData"]
                if (userDataCookie == "false"){
                    application.log.info(userDataCookie)
                }
                if (userDataCookie != null && userDataCookie != "false") {
                    val userInfo = userDataCookie.split(":")
                    pessoa.nome = userInfo[0]
                    pessoa.email = userInfo[1]
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
                call.respond(FreeMarkerContent("info-pessoa.ftl", mapOf("pessoa" to pessoa)))

            }
            post("informacoes"){
                val formParameters = call.receiveParameters()
                val title = formParameters.getOrFail("title")
                val body = formParameters.getOrFail("body")
                val newEntry = Article.newEntry(title, body)
                articles.add(newEntry)
                call.respondRedirect("/skybook/${newEntry.id}")
            }


            get("pagamento"){
                val userDataCookie = call.request.cookies["userData"]
                val userInfo = userDataCookie?.split(":")
                pessoa.nome = userInfo!![0]
                call.respond(FreeMarkerContent("pagamento.ftl", mapOf("pessoa" to pessoa)))
            }


        }

    }
}