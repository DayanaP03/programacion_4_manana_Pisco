fun main() {
    println("Bienvenido a PlatiumRooms ")

    println("Ingresa tu nombre:")
    val nombre = readLine() ?: ""

    println("Ingresa tu temperatura (°C):")
    val temperatura = readLine()?.toDoubleOrNull() ?: 36.5

    println("\n--- Validando datos ---")

    if (temperatura >= 40) {
        println(" $nombre, fiebre muy alta. Acceso denegado")
    } else if (temperatura >= 38) {
        println(" $nombre, fiebre detectada. Acceso restringido")
    } else {
        println(" $nombre, acceso permitido al hotel")
    }

    println("\n--- Datos registrados ---")
    println("Nombre: $nombre")
    println("Temperatura: $temperatura °C")
}