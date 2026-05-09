

interface MetodoPago {
    fun procesarPago(total: Double): Boolean
    val nombreMetodo: String
}

class PagoTarjeta(val numeroTarjeta: String) : MetodoPago {

    override val nombreMetodo = "Tarjeta de Crédito"

    override fun procesarPago(total: Double): Boolean {
        println("💳 Procesando pago de $${"%.2f".format(total)}")
        println("Tarjeta: $numeroTarjeta")
        return true
    }
}


class PagoPayPal(val correo: String) : MetodoPago {

    override val nombreMetodo = "PayPal"

    override fun procesarPago(total: Double): Boolean {
        println("🅿️ Enviando pago de $${"%.2f".format(total)}")
        println("Cuenta: $correo")
        return true
    }
}

class PagoEfectivo : MetodoPago {

    override val nombreMetodo = "Efectivo"

    override fun procesarPago(total: Double): Boolean {
        println("💵 Pago recibido en efectivo")
        println("Total: $${"%.2f".format(total)}")
        return true
    }
}

class ReservaHotel(
    val cliente: String,
    val habitacion: Int,
    val noches: Int,
    val precioPorNoche: Double
) {

    fun calcularTotal(): Double {
        return noches * precioPorNoche
    }
}


fun realizarCobro(reserva: ReservaHotel, metodoPago: MetodoPago) {

    val total = reserva.calcularTotal()

    println("================================")
    println("Cliente: ${reserva.cliente}")
    println("Habitación: ${reserva.habitacion}")
    println("Noches: ${reserva.noches}")
    println("Total a pagar: $${"%.2f".format(total)}")
    println("Método: ${metodoPago.nombreMetodo}")

    val pagoExitoso = metodoPago.procesarPago(total)

    println(
        if (pagoExitoso)
            "✅ Reserva pagada correctamente"
        else
            "❌ Error al procesar el pago"
    )
}

fun main() {

    val reserva = ReservaHotel(
        cliente = "Dayana",
        habitacion = 305,
        noches = 4,
        precioPorNoche = 75.0
    )

    val metodosPago: List<MetodoPago> = listOf(
        PagoTarjeta("**** **** **** 4567"),
        PagoPayPal("dayana@gmail.com"),
        PagoEfectivo()
    )

    metodosPago.forEach {
        realizarCobro(reserva, it)
    }
}