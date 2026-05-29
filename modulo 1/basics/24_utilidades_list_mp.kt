fun main() {
    println("=== Hotel - List Utils ===")

    val precios = listOf(30, 50, 80, 40, 60)
    println(precios)

    // map
    val preciosConIVA = precios.map { it * 1.12 }
    println("Con IVA: $preciosConIVA")

    // filter
    val caros = precios.filter { it > 50 }
    println("Caros: $caros")

    // reduce
    val total = precios.reduce { acc, i -> acc + i }
    println("Total ingresos: $total")

    // orden
    println("Asc: ${precios.sorted()}")
    println("Desc: ${precios.sortedDescending()}")

    // agregación
    println("Promedio: ${precios.average()}")
    println("Maximo: ${precios.max()}")
    println("Minimo: ${precios.min()}")

    // búsqueda
    println("Mayor a 50: ${precios.find { it > 50 }}")
    println("¿Todos > 20?: ${precios.all { it > 20 }}")
}