package com.example.models

import java.util.concurrent.atomic.AtomicInteger

class Voos
private constructor(
    val id: Int, 
    var origem: String, 
    var destino: String, 
    var dataVoo: String
    ) {

    companion object {
        private val idCounter = AtomicInteger()

        fun newEntry(
            origem: String, 
            destino: String, 
            dataVoo: String
        )  = Voos(idCounter.getAndIncrement(), origem, destino, dataVoo)
    }
}

val voos = mutableListOf<Voos>()         