data class CategoriaApp(val id: Int, val nombre: String)

data class ProductoApp(
    val id:        Int,
    val nombre:    String,
    val precio:    Double,
    val stock:     Int,
    val categoria: CategoriaApp,
    val activo:    Boolean = true
) {
    // ABSTRACCIÓN: el usuario consulta disponible sin saber la lógica
    val disponible: Boolean get() = activo && stock > 0
    val precioConIva: Double get() = precio * 1.19

    // Devuelve una copia — inmutabilidad como forma de encapsulamiento
    fun aplicarDescuento(porcentaje: Double): ProductoApp {
        require(porcentaje in 0.0..100.0) { "Descuento debe ser entre 0 y 100" }
        return copy(precio = precio * (1 - porcentaje/ 100))
    }
}

// ENCAPSULAMIENTO: el estado del catálogo es privado y mutable internamente
object CatalogoProductosApp {
    private val categorias = mutableListOf(
        CategoriaApp(1, "Periféricos"),
        CategoriaApp(2, "Pantallas"),
        CategoriaApp(3, "Audio")
    )
    private val productos   = mutableListOf<ProductoApp>()
    private var siguienteId = 1

    fun agregarProducto(nombre: String, precio: Double, stock: Int, categoriaId: Int): ProductoApp? {
        val categoria = categorias.find { it.id == categoriaId } ?: return null
        val producto  = ProductoApp(siguienteId++, nombre, precio, stock, categoria)
        productos.add(producto)
        return producto
    }

    // ABSTRACCIÓN: interfaz pública limpia — solo lectura de listas
    fun listar(): List<ProductoApp>              = productos.toList()
    fun disponibles(): List<ProductoApp>         = productos.filter { it.disponible }
    fun porCategoria(id: Int): List<ProductoApp> = productos.filter { it.categoria.id == id }
    fun buscar(query: String): List<ProductoApp> =
        productos.filter { it.nombre.contains(query, ignoreCase = true) }
}

fun main() {
    CatalogoProductosApp.agregarProducto("Teclado mecánico",   89.99, 15, 1)
    CatalogoProductosApp.agregarProducto("Mouse inalámbrico",  29.99,  0, 1)
    CatalogoProductosApp.agregarProducto("Monitor 27\"",      349.99,  5, 2)
    CatalogoProductosApp.agregarProducto("Auriculares BT",    149.99,  8, 3)

    println("=== Todos los productos ===")
    CatalogoProductosApp.listar().forEach { p ->
        val estado = if (p.disponible) "✅" else "❌"
        println("$estado ${p.nombre} — ${"%.2f".format(p.precioConIva)} (con IVA)")
    }

    println("\n=== Disponibles con 10% descuento ===")
    CatalogoProductosApp.disponibles()
        .map { it.aplicarDescuento(10.0) }
        .forEach { println("  ${it.nombre}: ${"%.2f".format(it.precio)}") }
}