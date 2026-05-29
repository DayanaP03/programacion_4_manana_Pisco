fun main() {
    println("=== Funciones - Hotel ===")

    val mensaje = bienvenida()
    println(mensaje)

    val total = calcularTotal(50, 3)
    println("Total reserva: $$total")

    println("Descuento: ${calcularDescuento(200)}")

    saludarCliente("Dayana")
}

// Función simple
fun bienvenida(): String {
    return "Bienvenido al sistema del hotel 🏨"
}

// Función con parámetros
fun calcularTotal(precio: Int, noches: Int): Int {
    return precio * noches
}

// Función tipo expresion
fun calcularDescuento(total: Int) = total * 0.10

// Función sin retorno
fun saludarCliente(nombre: String) {
    println("Hola $nombre, gracias por reservar")
}