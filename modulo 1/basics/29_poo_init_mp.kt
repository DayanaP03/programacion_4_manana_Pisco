
class HabitacionInit(val numero: Int, val ocupacion: Int) {

    val estado: String
    val nivel: String

    init {
    
        require(numero > 0) { "Numero invalido" }
        require(ocupacion in 0..100) { "Ocupacion debe ser 0-100" }

        estado = if (ocupacion == 0) "Libre" else "Ocupada"

        nivel = when {
            ocupacion <= 40 -> "Baja"
            ocupacion <= 70 -> "Media"
            else -> "Alta"
        }
    }
}

fun main() {
    val h = HabitacionInit(101, 75)

    println(h.estado)  
    println(h.nivel)   
}