package com.example.models

class DadosVoo
private constructor(var nome: String, var email: String, var telefone: String, var pagamento: Boolean) {
    companion object {
        fun newEntry(nome: String, email: String, telefone: String, pagamento: Boolean) = DadosVoo(nome, email, telefone, pagamento)
    }
}


val dadosVoo = DadosVoo.newEntry(
    "",
    "",
    "",
    false
)