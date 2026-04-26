class HabitacionCS(val numero: Int, val ocupacion: Int) {

    val estado: String
        get() = if (ocupacion == 0) "Libre" else "Ocupada"

    val nivel: String
        get() = when {
            ocupacion <= 40 -> "Baja"
            ocupacion <= 70 -> "Media"
            else -> "Alta"
        }

    constructor(numero: Int) : this(numero, 0)
    constructor(numero: Int, ocupacion: Double) : this(numero, ocupacion.toInt())

    override fun toString() =
        "Habitacion $numero | $ocupacion% | $nivel"
}

fun main() {
    val h1 = HabitacionCS(101, 50)
    val h2 = HabitacionCS(102)
    val h3 = HabitacionCS(103, 80.0)

    println(h1)
    println(h2)
    println(h3)
}