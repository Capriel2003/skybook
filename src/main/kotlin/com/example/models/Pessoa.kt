package com.example.models

class Pessoa
private constructor(var nome: String, var email: String, var senha: String) {
    companion object {
        fun newEntry(nome: String, email: String, senha: String) = Pessoa(nome, email, senha)
    }
}


val pessoa = Pessoa.newEntry(
    "",
    "",
    ""
)