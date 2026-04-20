fun main() {
    println("=== Hotel - Listas ===")

    // Lista inmutable (tipos de habitación)
    val habitaciones = listOf("Estandar", "Deluxe", "Suite")

    println("Total: ${habitaciones.size}")
    println("Primera: ${habitaciones.first()}")
    println("Ultima: ${habitaciones.last()}")
    println("Existe Suite: ${"Suite" in habitaciones}")

    // Recorrer
    for (h in habitaciones) {
        println("Tipo: $h")
    }

    // Lista mutable (clientes)
    val clientes = mutableListOf("Ana", "Luis")
    clientes.add("Carlos")
    clientes.remove("Luis")
    println(clientes)

    // ArrayDeque (turnos/check-in)
    val turnos = ArrayDeque<String>()
    turnos.addFirst("Ana")
    turnos.addLast("Carlos")
    turnos.removeFirst()

    println("Turnos: $turnos")
}