class HabitacionEjemplo(val numero: Int, private val ocupacion: String)

class Habitacion2(val numero: Int, val ocupacion: Int) {

    fun estado() = when {
        ocupacion == 0 -> "Sin ocupación"
        ocupacion <= 40 -> "Baja"
        ocupacion <= 70 -> "Media"
        else -> "Alta"
    }

    fun esAlta() = ocupacion > 70
}

fun main() {
    val h1 = HabitacionEjemplo(101, "30%")
    println(h1.numero)
  

    val h2 = Habitacion2(102, 80)
    println("Estado: ${h2.estado()}")
    println("Alta ocupacion: ${h2.esAlta()}")
}