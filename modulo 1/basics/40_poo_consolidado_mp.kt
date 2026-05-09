sealed class Notificacio(
    val titulo: String,
    val mensaje: String
) {

    abstract fun formatear(): String

    data class Email(
        val destinatario: String,
        val asunto: String,
        val cuerpo: String
    ) : Notificacion(asunto, cuerpo) {

        override fun formatear(): String {

            return "🏨 Reserva Email → " +
                    destinatario +
                    "\nHabitación: " +
                    titulo +
                    "\n" +
                    mensaje
        }
    }

    data class Push(
        val dispositivo: String,
        val icono: String = "🔔"
    ) : Notificacion("Push", "") {

        override fun formatear(): String {

            return icono +
                    " Reserva Push → " +
                    dispositivo +
                    ": " +
                    titulo
        }
    }

    data class Sms(
        val telefono: String,
        val texto: String
    ) : Notificacion("SMS", texto) {

        override fun formatear(): String {

            return "📱 Reserva SMS → " +
                    telefono +
                    ": " +
                    texto
        }
    }

    object Silenciosa : Notificacion("", "") {

        override fun formatear(): String {

            return "❌ Reserva cancelada"
        }
    }
}

interface EnviadorNotificacio {

    val nombre: String

    fun enviar(notificacion: Notificacion): Boolean
}

class ServicioEmai : EnviadorNotificacion {

    override val nombre = "Email"

    override fun enviar(notificacion: Notificacion): Boolean {

        if (notificacion !is Notificacion.Email) {
            return false
        }

        println("Procesando reserva Email → " +
                notificacion.destinatario)

        return true
    }
}

class ServicioPus : EnviadorNotificacion {

    override val nombre = "Push"

    override fun enviar(notificacion: Notificacion): Boolean {

        if (notificacion !is Notificacion.Push) {
            return false
        }

        println("Procesando reserva Push → " +
                notificacion.dispositivo)

        return true
    }
}

class Dispatche(
    private val servicios: List<EnviadorNotificacion>
) {

    fun enviar(notificacion: Notificacion) {

        println(notificacion.formatear())

        val exito = servicios.any {
            it.enviar(notificacion)
        }

        if (!exito) {
            println("⚠️ Sin servicio disponible")
        }

        println()
    }
}

fun main() {

    val dispatcher = Dispatcher(
        listOf(
            ServicioEmail(),
            ServicioPush()
        )
    )

    val lista = listOf(

        Notificacion.Email(
            "dayana@test.com",
            "Reserva Suite",
            "Reserva confirmada"
        ),

        Notificacion.Push(
            "Android-Dayana"
        ),

        Notificacion.Sms(
            "+593999999999",
            "Tu reserva fue aprobada"
        ),

        Notificacion.Silenciosa
    )

    for (notificacion in lista) {
        dispatcher.enviar(notificacion)
    }
}