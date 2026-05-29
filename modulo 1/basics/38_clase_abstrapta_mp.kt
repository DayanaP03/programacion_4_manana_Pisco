abstract class Habitacio(var tipo: String) {

    abstract var precio: Double
    abstract var capacidad: Int

    abstract fun descripcion(): String

    fun compararPreci(otra: Habitacion): String {

        return if (precio > otra.precio) {
            tipo + " es más cara que " + otra.tipo
        } else if (precio < otra.precio) {
            tipo + " es más barata que " + otra.tipo
        } else {
            tipo + " y " + otra.tipo + " tienen el mismo precio"
        }
    }

    override fun toString(): String {
        return descripcion() + " | Precio: $" + precio
    }
}

class HabitacionSimpl(var noches: Int)
    : Habitacio("Habitación Simple") {

    override var precio: Double = noches * 40.0
    override var capacidad: Int = 1

    override fun descripcion(): String {
        return "Habitación simple para " + capacidad +
                " persona por " + noches + " noches"
    }
}

class HabitacionDoble(var noches: Int)
    : Habitacio("Habitación Doble") {

    override var precio: Double = noches * 70.0
    override var capacidad: Int = 2

    override fun descripcion(): String {
        return "Habitación doble para " + capacidad +
                " personas por " + noches + " noches"
    }
}

class Suite(var noches: Int)
    : Habitacio("Suite") {

    override var precio: Double = noches * 120.0
    override var capacidad: Int = 4

    override fun descripcion(): String {
        return "Suite para " + capacidad +
                " personas por " + noches + " noches"
    }
}

fun main() {

    val habitacion1 = HabitacionSimple(2)
    val habitacion2 = HabitacionDoble(3)
    val habitacion3 = Suite(1)

    println(habitacion1)
    println(habitacion2)
    println(habitacion3)

    println(habitacion1.compararPreci(habitacion2))
}