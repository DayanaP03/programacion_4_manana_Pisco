class ProductoInventario(
    var codigo: String,
    var nombre: String,
    private var precio: Double,
    private var stock: Int
) {

    fun consultarPrecio() {
        println("Precio del producto: $$precio")
    }

    fun consultarStock() {
        println("Stock disponible: $stock unidades")
    }

    fun aumentarStock(cantidad: Int) {
        if (cantidad > 0) {
            stock += cantidad
            println("Stock actualizado: $stock")
        } else {
            println("La cantidad debe ser mayor a 0")
        }
    }


    fun disminuirStock(cantidad: Int) {
        if (cantidad > 0 && stock - cantidad >= 0) {
            stock -= cantidad
            println("Stock actualizado: $stock")
        } else {
            println("No es posible disminuir el stock")
        }
    }


    fun cambiarPrecio(nuevoPrecio: Double) {
        if (nuevoPrecio >= 0) {
            precio = nuevoPrecio
            println("Nuevo precio: $$precio")
        } else {
            println("El precio no puede ser negativo")
        }
    }
}

fun main() {

    val producto1 = ProductoInventario(
        "P001",
        "Laptop",
        850.0,
        10
    )

    producto1.consultarPrecio()
    producto1.consultarStock()

    producto1.aumentarStock(5)
    producto1.disminuirStock(3)
    producto1.cambiarPrecio(900.0)
}