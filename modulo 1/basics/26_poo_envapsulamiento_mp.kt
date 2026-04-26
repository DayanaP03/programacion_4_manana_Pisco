
class HabitacionV2(val numero: Int, ocupacionInicial: Int) {

    private var ocupacion: Int = ocupacionInicial  

    internal val codigo: String =
        "HAB${(100..999).random()}"

    protected fun calcularNivel(): String =
        when {
            ocupacion == 0 -> "Sin ocupacion"
            ocupacion <= 40 -> "Baja"
            ocupacion <= 70 -> "Media"
            else -> "Alta"
        }

    fun registrarOcupacion(valor: Int) {
        require(valor in 0..100) { "Debe ser entre 0 y 100" }
        ocupacion = valor
        println("Ocupacion actual: ${consultarOcupacion()}%")
    }

    fun aumentarOcupacion(valor: Int) {
        require(valor > 0)
        ocupacion = (ocupacion + valor).coerceAtMost(100)
        println("Nueva ocupacion: ${consultarOcupacion()}%")
    }

    fun consultarOcupacion(): Int = ocupacion

    fun estado(): String = calcularNivel()
}

fun main() {
    val hab = HabitacionV2(101, 20)

    hab.aumentarOcupacion(30)
    println("Estado: ${hab.estado()}")

    hab.registrarOcupacion(80)
    println("Estado: ${hab.estado()}")

    println("Habitacion: ${hab.numero}")
    println("Ocupacion final: ${hab.consultarOcupacion()}%")
}