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
            call.respondRedirect("articles")
        }

        route("articles") {
            get {
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
                call.respondRedirect("/articles/${newEntry.id}")
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
                        call.respondRedirect("/articles/$id")
                    }
                    "delete" -> {
                        articles.removeIf { it.id == id }
                        call.respondRedirect("/articles")
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
                call.respondRedirect("/articles/cadastros/${novosDados.id}")
            }
            get("cadastros/{id}"){
                val id = call.parameters.getOrFail<Int>("id").toInt()
                application.log.info(id.toString())
                application.log.info("to cerrto")
                application.log.info(cadastros[1].nome)
                application.log.info(cadastros[1].id.toString())
                call.respond(FreeMarkerContent("listacadastro.ftl", mapOf("cadastros" to cadastros)))
            }
            get("home"){
                call.respond(FreeMarkerContent("home.ftl", model = null))
            }

            get("informacoes"){
                call.respond(FreeMarkerContent("info-pessoa.ftl", model = null))
            }





        }



    }
}