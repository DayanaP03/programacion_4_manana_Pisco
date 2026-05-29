fun main() {
    println("=== Hotel - Set ===")

    // Habitaciones ocupadas (no se repiten)
    val ocupadas = setOf(101, 102, 103, 101)
    println("Habitaciones ocupadas: $ocupadas")

    // Operaciones
    val piso1 = setOf(101, 102, 103)
    val piso2 = setOf(103, 104, 105)

    println("Union: ${piso1 union piso2}")
    println("Interseccion: ${piso1 intersect piso2}")
    println("Disponibles en piso1: ${piso1 subtract piso2}")

    // Set mutable (servicios del hotel)
    val servicios = mutableSetOf("WiFi", "Piscina", "Spa")
    println(servicios)

    servicios.add("WiFi") // no se repite
    servicios.add("Gimnasio")
    servicios.remove("Spa")

    println("Servicios: $servicios")
    println("Tiene WiFi: ${"WiFi" in servicios}")
}