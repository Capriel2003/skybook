package com.example.models

import java.util.concurrent.atomic.AtomicInteger

class Cadastro
private constructor(val id: Int, var nome: String, var email: String, var senha: String) {
    companion object {
        private val cont = AtomicInteger()

        fun newEntry(nome: String, email: String, senha: String) = Cadastro(cont.getAndIncrement(), nome, email, senha)
    }
}

val cadastros = mutableListOf(Cadastro.newEntry(
    "Gabriel",
    "teste@gmail.com",
    "1234"
))