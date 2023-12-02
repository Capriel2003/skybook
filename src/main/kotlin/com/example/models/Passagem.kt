package com.example.models

class Passagem(var nome: String, var email: String, var telefone: String, var compania: String, var origem: String, var destino: String, var data: String, var preco: Double, var assento: Int, var pagamento: Boolean) {
}

val passagens = listOf(Passagem(
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
