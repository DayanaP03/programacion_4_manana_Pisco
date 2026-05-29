fun main() {
    println("--- Sistema de Reservas de Hotel ---")
    
    println("Numero de noches:")
    val noches = readLine()?.toIntOrNull() ?: 1

    println("¿Es cliente frecuente? (S/N):")
    val clienteFrecuente = readLine()?.trim()?.lowercase() == "s"

    var tipoHabitacion = ""
    if (clienteFrecuente) {
        println("Tipo de habitacion (ESTANDAR / DELUXE / SUITE):")
        tipoHabitacion = readLine()?.trim()?.uppercase() ?: ""
    } else {
        println("Tipo de habitacion (ESTANDAR / DELUXE):")
        tipoHabitacion = readLine()?.trim()?.uppercase() ?: ""
    }

    val precioPorNoche = when {
        tipoHabitacion == "ESTANDAR" -> 30.0
        tipoHabitacion == "DELUXE" -> 50.0
        tipoHabitacion == "SUITE" && clienteFrecuente -> 80.0
        tipoHabitacion == "SUITE" -> 100.0
        else -> 40.0
    }

    val descuento = when {
        clienteFrecuente && noches >= 5 -> 0.20
        clienteFrecuente -> 0.10
        noches >= 7 -> 0.15
        else -> 0.0
    }

    val total = (precioPorNoche * noches) * (1 - descuento)

    println("Precio por noche: $${"%.2f".format(precioPorNoche)}")
    println("Descuento aplicado: ${descuento * 100}%")
    println("Total a pagar: $${"%.2f".format(total)}")
}