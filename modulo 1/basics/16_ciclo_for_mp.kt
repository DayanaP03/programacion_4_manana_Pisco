fun main() {
    println("=== Hotel - Ciclo For ===")

    // Habitaciones
    for (i in 1..5) {
        println("Habitacion: $i")
    }

    // Tipos de habitación
    val tipos = listOf("Estandar", "Deluxe", "Suite")
    for ((i, tipo) in tipos.withIndex()) {
        println("ID: $i - Tipo: $tipo")
    }

    // Saltar una habitación en mantenimiento
    for (i in 1..5) {
        if (i == 3) continue
        println("Disponible: $i")
    }

    // Lista de reservas (nombre, noches, precio)
    val reservas = listOf(
        Triple("Ana", 2, 30.0),
        Triple("Luis", 5, 50.0)
    )

    for ((_, r) in reservas.withIndex()) {
        val (nombre, noches, precio) = r
        println("$nombre - Total: ${noches * precio}")
    }
}