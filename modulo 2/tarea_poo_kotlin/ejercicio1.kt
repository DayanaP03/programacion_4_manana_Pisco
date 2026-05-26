class Libro(
    var titulo: String,
    var autor: String,
    var anioPublicacion: Int,
    var numeroPaginas: Int
) {

    // Método para mostrar información
    fun mostrarInformacion() {
        println("Titulo: $titulo")
        println("Autor: $autor")
        println("Ano de publicacion: $anioPublicacion")
        println("Numero de paginas: $numeroPaginas")
    }

    fun tipoLibro() {
        if (anioPublicacion < 2000) {
            println("El libro es antiguo.")
        } else {
            println("El libro es reciente.")
        }
    }
}

fun main() {

    val libro1 = Libro(
        "Cien años de soledad",
        "Gabriel García Márquez",
        1967,
        417
    )
    libro1.mostrarInformacion()
    libro1.tipoLibro()
}