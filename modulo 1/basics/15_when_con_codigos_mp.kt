fun main() {
    println("--- Gestión de Reservas de Hotel ---")

    println("Nombre del cliente:")
    val nombreCliente = readLine()?.trim()?.replaceFirstChar { it.uppercase() } ?: "Sin nombre"

    println("Estado de la reserva (CONFIRMADA/PENDIENTE/CANCELADA/VIP):")
    val estado = readLine()?.trim()?.uppercase() ?: ""

    when (estado) {
        "CONFIRMADA" -> {
            println("Reserva confirmada para: $nombreCliente")
            println("Habitacion lista para el check-in")
            println("Bienvenido al hotel 🏨")
        }
        "PENDIENTE" -> {
            println("Reserva pendiente: $nombreCliente")
            println("Esperando confirmacion de pago")
            println("Contactar al cliente en breve")
        }
        "CANCELADA" -> {
            println("Reserva cancelada: $nombreCliente")
            println("Liberar habitacion")
            println("Actualizar disponibilidad")
        }
        "VIP" -> {
            println("Cliente VIP: $nombreCliente")
            println("Asignar mejor habitacion disponible")
            println("Incluir servicios premium (spa, desayuno)")
        }
        else -> {
            println("Estado de reserva no reconocido")
        }
    }
}