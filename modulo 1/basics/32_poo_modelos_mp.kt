data class HabitacionModel(
    val numero: Int,
    val tipo: String,
    val precio: Double,
    val ocupada: Boolean = true
)

fun main() {
    val h1 = HabitacionModel(101, "Suite", 120.0)
    val h2 = HabitacionModel(101, "Suite", 120.0)
    val h3 = HabitacionModel(102, "Doble", 80.0)


    println(h1)


    println(h1 == h2)  
    println(h1 == h3)   


    val promo = h1.copy(precio = 90.0)
    val libre = h1.copy(ocupada = false)

    println(promo)
    println(libre)

    val (num, tipo, precio) = h1
    println("$num - $tipo - $$precio")


    listOf(h1, h3).forEach { (n, t, p) ->
        println("Hab $n: $t - $$p")
    }
}