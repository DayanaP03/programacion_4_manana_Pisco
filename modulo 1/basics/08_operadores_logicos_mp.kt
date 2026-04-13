fun main() {
    val edad = 19
    val tieneReserva = true
    val pagoRealizado = false

    println("Validación de acceso al hotel")

    // AND
    println("Puede ingresar: ${edad >= 18 && tieneReserva}")

    // OR
    println("Tiene acceso especial: ${tieneReserva || pagoRealizado}")

    // NOT
    println("Pago pendiente: ${!pagoRealizado}")
}