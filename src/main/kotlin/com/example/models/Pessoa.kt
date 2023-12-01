package com.example.models

import java.util.concurrent.atomic.AtomicInteger

class Pessoa
private constructor(var nome: String, var email: String, var senha: String) {
    companion object {
        private val cont = AtomicInteger()

        fun newEntry(nome: String, email: String, senha: String) = Pessoa(nome, email, senha)
    }
}


val pessoa = Pessoa.newEntry(
    "",
    "",
    ""
)