interface Reservable {

    val codigoReserva: String
    fun generarReserva(): String
    val version: Int
        get() = 1
}

interface ValidacionReserva {

    val errores: List<String>

    val esValida: Boolean
        get() = errores.isEmpty()

    fun validar(): Boolean

    fun imprimirErrores() {

        if (errores.isEmpty()) {
            println("Sin errores")
        } else {
            for (error in errores) {
                println("❌ " + error)
            }
        }
    }
}

data class ReservaHote(

    override val codigoReserva: String,
    val cliente: String,
    val habitacion: String,
    val noches: Int,
    val total: Double

) : Reservable, ValidacionReserva {

    override fun generarReserva(): String {

        return codigoReserva + "|" +
                cliente + "|" +
                habitacion + "|" +
                noches + "|" +
                total
    }

    override val errores: List<String>
        get() {

            val listaErrores = mutableListOf<String>()

            if (cliente.isBlank()) {
                listaErrores.add("El cliente no puede estar vacío")
            }

            if (habitacion.isBlank()) {
                listaErrores.add("Debe seleccionar una habitación")
            }

            if (noches <= 0) {
                listaErrores.add("Las noches deben ser mayores a cero")
            }

            if (total <= 0) {
                listaErrores.add("El total debe ser mayor a cero")
            }

            return listaErrores
        }

    override fun validar(): Boolean {
        return esValida
    }
}


