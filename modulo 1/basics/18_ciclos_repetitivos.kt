fun main() {
    println("Ciclos repeat")
    println("¿Cuantas pulsaciones deseas medir?")

    val mediciones = readLine()?.toIntOrNull() ?: 3
    var totalPulsaciones = 0

    repeat(mediciones) { i ->
        println("Medición ${i + 1} (pulsos en 15 seg):")
        val pulsos = readLine()?.toIntOrNull() ?: 0

        totalPulsaciones += pulsos * 4 // convertir a 60 seg
    }

    val promedio = totalPulsaciones / mediciones

    val clasificacion = when {
        promedio < 60 -> "Bradicardia"
        promedio <= 100 -> "Normal"
        else -> "Taquicardia"
    }

    println("Frecuencia cardiaca promedio: $promedio lpm")
    println("Clasificación: $clasificacion")
}