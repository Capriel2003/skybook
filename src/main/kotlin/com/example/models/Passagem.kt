package com.example.models

class Passagem
private constructor(var nome: String, var email: String, var senha: String, var telefone: String, var origem: String, var destino: String, var data: String, var preco: Double, var assento: Int, var pagamento: Boolean) {
    companion object {
        fun newEntry(nome: String, email: String, senha: String, telefone: String, origem: String, destino: String, data: String, preco: Double, assento: Int, pagamento: Boolean) = Passagem(nome, email, senha, telefone, origem, destino, data, preco, assento,pagamento)
    }
}

val passagem = Passagem.newEntry(
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
)
