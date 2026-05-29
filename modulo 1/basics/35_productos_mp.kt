data class HabitacionSimple(val num: Int, val precio: Double, val ocupada: Boolean) {
    val disponible get() = !ocupada
    fun desc(p: Double) = copy(precio = precio * (1 - p/100))
}

object GestionHotel {
    private val lista = mutableListOf<HabitacionSimple>()

    fun add(n: Int, p: Double, o: Boolean) =
        lista.add(HabitacionSimple(n, p, o))

    fun disp() = lista.filter { it.disponible }
    fun all() = lista
}

fun main() {
    GestionHotel.add(101, 100.0, false)
    GestionHotel.add(102, 80.0, true)

    GestionHotel.all().forEach { println(it) }

    println("Disponibles:")
    GestionHotel.disp().map { it.desc(10.0) }
        .forEach { println(it) }
}