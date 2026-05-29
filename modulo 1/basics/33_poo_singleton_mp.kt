object ConfiguracionHotel {
    val nombreHotel: String = "Hotel Paraiso"
    val ciudad: String = "Quito"
    private val claveInterna: String = "ABC123"  

    fun info() = "$nombreHotel - $ciudad"
    fun acceso() = "Clave: $claveInterna"
}

class UsuarioHotel private constructor(val id: Int, val nombre: String) {

    companion object {
        private var contadorId = 0
        fun crear(nombre: String, email: String): UsuarioHotel? {
            if (nombre.isBlank() || !email.contains("@")) return null
            return UsuarioHotel(++contadorId, nombre.trim())
        }

        const val ROL_DEFECTO = "cliente"
    }

    override fun toString() = "Usuario(id=$id, nombre=$nombre)"
}

fun main() {
    println(ConfiguracionHotel.info())

    val u = UsuarioHotel.crear("Ana", "ana@test.com")
    println(u)
}