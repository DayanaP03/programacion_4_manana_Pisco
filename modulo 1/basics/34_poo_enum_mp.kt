enum class EstadoHabitacion {
    LIBRE, OCUPADA, LIMPIEZA
}

fun main() {
    val estado = EstadoHabitacion.OCUPADA

    val mensaje = when (estado) {
        EstadoHabitacion.LIBRE -> "Disponible"
        EstadoHabitacion.OCUPADA -> "Ocupada"
        EstadoHabitacion.LIMPIEZA -> "En limpieza"
    }

    println(mensaje)
}