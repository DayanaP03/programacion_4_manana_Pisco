
open class Reserva(
    val cliente: String,
    val habitacion: Int,
    val noches: Int
) {

    open fun calcularTotal(): Double {
        return noches * 40.0
    }

    open fun mostrarDetalle() {
        println("Cliente: $cliente")
        println("Habitación: $habitacion")
        println("Noches: $noches")
        println("Total: $${calcularTotal()}")
    }


    fun confirmarReserva() {
        println("Reserva confirmada para $cliente")
    }
}


class ReservaVIP(
    cliente: String,
    habitacion: Int,
    noches: Int,
    val servicioSpa: Boolean
) : Reserva(cliente, habitacion, noches) {


    override fun calcularTotal(): Double {
        var total = noches * 80.0

        if (servicioSpa) {
            total += 50
        }

        return total
    }


    override fun mostrarDetalle() {
        super.mostrarDetalle() // reutiliza lo del padre

        if (servicioSpa) {
            println("Incluye servicio de SPA")
        }

        println("Reserva VIP")
    }
}

class ReservaFamiliar(
    cliente: String,
    habitacion: Int,
    noches: Int,
    val cantidadPersonas: Int
) : Reserva(cliente, habitacion, noches) {

    override fun calcularTotal(): Double {
        return (noches * 60.0) + (cantidadPersonas * 10)
    }

    override fun mostrarDetalle() {
        println("${super.cliente} realizó una reserva familiar")
        println("Personas: $cantidadPersonas")
        println("Total familiar: $${calcularTotal()}")
    }
}

fun main() {

    val vip = ReservaVIP(
        cliente = "Dayana",
        habitacion = 101,
        noches = 3,
        servicioSpa = true
    )

    vip.mostrarDetalle()
    vip.confirmarReserva()

    println("----------------------")

    val familiar = ReservaFamiliar(
        cliente = "Carlos",
        habitacion = 205,
        noches = 2,
        cantidadPersonas = 4
    )

    familiar.mostrarDetalle()
    familiar.confirmarReserva()
}