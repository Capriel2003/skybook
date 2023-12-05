package com.example.models

class Passagem(var nome: String, var cpf: String, var email: String, var telefone: String, var companhia: String, var origem: String, var destino: String, var data: String, var hora: String, var preco: Double, var assento: Int, var pagamento: Boolean) {
}

val passagens = listOf(Passagem(
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    0.0,
    0,
    false
))
