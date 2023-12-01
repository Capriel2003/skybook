package com.example.plugins

import com.example.models.*
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
                if (userDataCookie != null) {
                    application.log.info("zz2zz")
                    val dados = getCadastroByName(userDataCookie)
                    application.log.info(userDataCookie)

                    pessoa.nome = dados?.nome.toString()
                    pessoa.email = dados?.email.toString()
                    pessoa.senha = dados?.senha.toString()

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

                call.response.cookies.append("userData","${novosDados.nome}")
                application.log.info("cadastrado")

                call.respondRedirect("/skybook/cadastros/${novosDados.id}")
            }
            get("cadastros/{id}"){
                val id = call.parameters.getOrFail<Int>("id").toInt()
                call.respond(FreeMarkerContent("listacadastro.ftl", mapOf("cadastros" to cadastros)))
            }
            get("home"){
                val userDataCookie = call.request.cookies["userData"]
                application.log.info(userDataCookie)
                if (userDataCookie != null) {
                    val dados = getCadastroByName(userDataCookie)
                    pessoa.nome = dados?.nome.toString()
                    pessoa.email = dados?.email.toString()
                    pessoa.senha = dados?.senha.toString()
                    call.respond(FreeMarkerContent("homecadastrado.ftl", mapOf("pessoa" to pessoa)))
                }
                call.respond(FreeMarkerContent("home.ftl", mapOf("articles" to articles)))
            }

            get("informacoes"){
                call.respond(FreeMarkerContent("info-pessoa.ftl", model = null))
            }


        }

    }
}