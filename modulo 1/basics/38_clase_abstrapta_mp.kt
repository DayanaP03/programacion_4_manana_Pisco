abstract class Habitacion(val tipo: String) {

    abstract val precio: Double
    abstract val capacidad: Int

    abstract fun descripcion(): String

    fun compararPrecio(otra: Habitacion): String {

        return when {
            precio > otra.precio -> "$tipo es más cara que ${otra.tipo}"
            precio < otra.precio -> "$tipo es más barata que ${otra.tipo}"
            else -> "$tipo y ${otra.tipo} tienen el mismo precio"
        }
    }

    override fun toString(): String {
        return descripcion() + " | Precio: $" + precio
    }
}

class HabitacionSimple(val noches: Int)
    : Habitacion("Habitación Simple") {

    override val precio: Double
        get() = noches * 40.0

    override val capacidad: Int
        get() = 1

    override fun descripcion(): String {
        return "Habitación simple para $capacidad persona por $noches noches"
    }
}

class HabitacionDoble(val noches: Int)
    : Habitacion("Habitación Doble") {

    override val precio: Double
        get() = noches * 70.0

    override val capacidad: Int
        get() = 2

    override fun descripcion(): String {
        return "Habitación doble para $capacidad personas por $noches noches"
    }
}

class Suite(val noches: Int)
    : Habitacion("Suite") {

    override val precio: Double
        get() = noches * 120.0

    override val capacidad: Int
        get() = 4

    override fun descripcion(): String {
        return "Suite para $capacidad personas por $noches noches"
    }
}

fun main() {

    val habitaciones: List<Habitacion> = listOf(
        HabitacionSimple(2),
        HabitacionDoble(3),
        Suite(1)
    )

    for (habitacion in habitaciones) {
        println(habitacion)
    }

    val masCara = habitaciones.maxByOrNull { it.precio }

    println("Habitación más cara: " + masCara?.tipo)

    println(habitaciones[0].compararPrecio(habitaciones[1]))
}