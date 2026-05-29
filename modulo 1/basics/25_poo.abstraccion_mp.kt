class Habitacion(
    val numero: Int,
    val nombre: String,
    private val ocupacion: Int   // privado
) {
    val estado: String
        get() = when {
            ocupacion == 0 -> "Sin ocupacion"
            ocupacion <= 40 -> "Ocupacion baja"
            ocupacion <= 70 -> "Ocupacion media"
            else -> "Alta ocupacion"
        }

    val esAlta: Boolean
        get() = ocupacion > 70

    override fun toString(): String {
        return "Hab $numero - $nombre ($ocupacion%)"
    }
}
fun main() {
    val h1 = Habitacion(101, "Suite", 80)
    val h2 = Habitacion(102, "Doble", 30)

    println(h1)
    println("Estado: ${h1.estado}")
    println("Alta ocupacion: ${h1.esAlta}")

    println()

    println(h2)
    println("Estado: ${h2.estado}")
    println("Alta ocupacion: ${h2.esAlta}")
}