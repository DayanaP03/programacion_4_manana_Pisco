fun main() {
    println("=== Hotel - Map ===")

    // Map inmutable (habitaciones y tipo)
    val habitaciones = mapOf(
        101 to "Estandar",
        102 to "Deluxe",
        103 to "Suite"
    )

    println(habitaciones[101])
    println(habitaciones[105] ?: "No existe")
    println(habitaciones.keys)
    println(habitaciones.values)

    for ((num, tipo) in habitaciones) {
        println("Hab $num - $tipo")
    }

    // Map mutable (precios)
    val precios = mutableMapOf(
        "Estandar" to 30,
        "Deluxe" to 50
    )

    precios["Suite"] = 80
    println(precios)

    precios["Estandar"] = 35
    println(precios)

    precios.remove("Deluxe")
    println(precios)

    precios.getOrPut("VIP") { 100 }
    println(precios)
}