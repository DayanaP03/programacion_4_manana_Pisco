fun main() {

    println("Sistema de selección de habitaciones")
    println("Elige una opción:")

    println("1 -> Habitación Económica")
    println("2 -> Habitación Estándar")
    println("3 -> Habitación Confort")
    println("4 -> Habitación Lujo")
    println("5 -> Habitación Premium")

    val codigo = readLine()?.toIntOrNull() ?: 0

    val habitacion = when (codigo) {
        1 -> "Habitación Económica "
        2 -> "Habitación Estándar "
        3 -> "Habitación Confort "
        4 -> "Habitación Lujo "
        5 -> "Habitación Premium "
        else -> "Opción no válida "
    }

    println("Seleccionaste: $habitacion")
}