interface MetodoPagos {
    val nombre: String
    fun procesarPago(monto: Double)
}

class PagoEfectivos : MetodoPagos {
    override val nombre: String = "Efectivo"

    override fun procesarPago(monto: Double) {
        println("Pago en $nombre realizado por $$monto")
    }
}

class PagoTarjetas(val tipo: String) : MetodoPagos {
    override val nombre: String = "Tarjeta ($tipo)"

    override fun procesarPago(monto: Double) {
        println("Procesando pago con $nombre por $$monto")
    }
}

class PagoTransferencias(val banco: String) : MetodoPagos {
    override val nombre: String = "Transferencia"

    override fun procesarPago(monto: Double) {
        println("$nombre realizada desde el banco $banco por $$monto")
    }
}

fun main() {
    val metodosPago = listOf(
        PagoEfectivos(),
        PagoTarjetas("Visa Platinum"),
        PagoTransferencias("BBVA")
    )

    val montoTotal = 250.75
    println("=== Sistema de Facturación ===")
    for (metodo in metodosPago) {
        metodo.procesarPago(montoTotal)
    }
}
