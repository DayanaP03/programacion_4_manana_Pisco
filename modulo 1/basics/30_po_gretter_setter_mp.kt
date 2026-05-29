
class HabitacionGS(ocupacionInicial: Int) {

    var ocupacion: Int = ocupacionInicial
        set(value) {
            require(value in 0..100) { "Ocupacion invalida (0-100)" }
            field = value
        }

    val estado: String
        get() = if (ocupacion == 0) "Libre" else "Ocupada"

    val nivel: String
        get() = when {
            ocupacion <= 40 -> "Baja"
            ocupacion <= 70 -> "Media"
            else -> "Alta"
        }

    val mensaje: String
        get() = "Ocupacion: $ocupacion% - $nivel"
}

fun main() {
    val h = HabitacionGS(50)

    println(h.mensaje)   

    h.ocupacion = 80
    println(h.mensaje)   

}