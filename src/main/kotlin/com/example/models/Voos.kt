package com.example.models

import java.util.concurrent.atomic.AtomicInteger

class Voos
private constructor(val id: Int, var origem: String, var destino: String) {
    companion object {
        private val idCounter = AtomicInteger()

        fun newEntry(origem: String, destino: String) = Voos(idCounter.getAndIncrement(), origem, destino)
    }
}

val listaVoos = mutableListOf(Voos.newEntry(
    "Sao Paulo",
    "Belo Horizonte"
))