fun main() {
    println("=== Hotel - Ciclo While ===")

    var opcion: String

    do {
        println("1. Nueva reserva")
        println("2. Ver mensaje")
        println("3. Salir")
        print("Elige opcion: ")

        opcion = readLine() ?: ""

        when (opcion) {
            "1" -> {
                println("Ingrese nombre del cliente:")
                val nombre = readLine() ?: ""
                println("Reserva creada para: $nombre")
            }
            "2" -> {
                println("Bienvenido al sistema del hotel 🏨")
            }
            "3" -> println("Saliendo del sistema...")
            else -> println("Opción no valida")
        }

    } while (opcion != "3")
}