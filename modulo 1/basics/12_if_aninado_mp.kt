fun main() {
    println("Sistema de acceso al hotel")
    println("¿Eres cliente VIP? (s/n)")
    val esVIP = readLine()?.trim()?.lowercase() == "s"
    
    println("Ingresa tu temperatura (°C):")
    val temperatura = readLine()?.toDoubleOrNull() ?: 36.5

    
    if (esVIP) {
        println("Cliente VIP ")
        if (temperatura < 38) {
            println("Acceso inmediato al hotel ")
        } else {
            println("Acceso restringido por temperatura alta")
        }
    } else {
        println("Cliente normal")
        if (temperatura < 38) {
            println("Acceso permitido")
        } else {
            println("Acceso denegado por seguridad")
        }
    }
}