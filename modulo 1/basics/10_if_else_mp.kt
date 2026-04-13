fun main() {
    
    println("Sistema de pago del hotel")
    println("¿Tiene descuento? (s/n)")

    val tieneDescuento = readLine()?.trim()?.lowercase() == "s"

    println("Costo base de la habitación:")
    val costoBase = readLine()?.toDoubleOrNull() ?: 0.0

    if (tieneDescuento) {
        val total = costoBase * 0.80  // 20% de descuento
        println(" Descuento aplicado")
        println("Total a pagar: $${"%.2f".format(total)}")
    } else {
        println(" Pago normal")
        println("Total a pagar: $${"%.2f".format(costoBase)}")
    }
}