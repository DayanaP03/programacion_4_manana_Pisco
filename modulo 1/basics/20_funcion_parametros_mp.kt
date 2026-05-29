fun main() {
    println("=== Hotel - Parámetros por defecto ===")

    println(crearReserva("Dayana"))
    println(crearReserva("Luis", noches = 3))
    println(crearReserva("Ana", 5, "Suite"))

    var opcion: Int
    var total = 0.0

    do {
        println("1. Reservar  2. Ver total  0. Salir")
        opcion = readLine()?.toIntOrNull() ?: 0

        when (opcion) {
            1 -> {
                println("Noches:")
                val noches = readLine()?.toIntOrNull() ?: 1

                println("Tipo (1.Estandar=30, 2.Deluxe=50, 3.Suite=80):")
                val tipo = readLine()?.toIntOrNull() ?: 1

                val precio = when (tipo) {
                    1 -> 30.0
                    2 -> 50.0
                    3 -> 80.0
                    else -> 30.0
                }

                total += precio * noches
                println("Reserva agregada ✔")
            }

            2 -> println("Total: $$total")
            0 -> println("Total final: $$total")
            else -> println("Opcion invalida")
        }

    } while (opcion != 0)
}

// Función con parámetros por defecto
fun crearReserva(
    nombre: String,
    noches: Int = 1,
    tipo: String = "Estándar",
    activo: Boolean = true
): String {
    return "Reserva[$nombre, noches=$noches, tipo=$tipo, activa=$activo]"
}