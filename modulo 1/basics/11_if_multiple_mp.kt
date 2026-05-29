fun main() {
    println(" Clasificación de hoteles por precio")
    
    println("Ingresa el precio por noche (USD):")

    val precio = readLine()?.toDoubleOrNull() ?: 0.0

    val clasificacion = if (precio <= 20) {
        "Económico "
    } else if (precio <= 50) {
        "Estándar"
    } else if (precio <= 100) {
        "Confort "
    } else if (precio <= 200) {
        "Lujo "
    } else {
        "Premium "
    }

    println("Clasificación: ${clasificacion.uppercase()}")
}