fun main() {
    println("=== Hotel - Registro de Reservas ===")
    println("¿Cuántas reservas deseas ingresar?")

    val cantidad = readLine()?.toIntOrNull() ?: 3
    var totalIngresos = 0.0

    repeat(cantidad) { i ->
        println("Reserva ${i + 1} - Precio por noche:")
        val precio = readLine()?.toDoubleOrNull() ?: 0.0

        println("Número de noches:")
        val noches = readLine()?.toIntOrNull() ?: 1

        totalIngresos += precio * noches
    }

    val promedio = totalIngresos / cantidad

    val categoria = when {
        promedio < 50 -> "Económica"
        promedio <= 150 -> "Media"
        else -> "Premium"
    }

    println("Ingreso promedio por reserva: $$promedio")
    println("Categoría: $categoria")
}