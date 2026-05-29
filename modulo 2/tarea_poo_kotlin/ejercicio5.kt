class Libros(
    private val codigoLibro: Int,
    private val nombreLibro: String,
    private val escritor: String
) {

    // Estado privado
    private var estadoDisponible: Boolean = true

    // Mostrar información
    fun mostrarDetalles() {
        val estado = if (estadoDisponible) "Disponible" else "Prestado"

        println("Código: $codigoLibro")
        println("Título: $nombreLibro")
        println("Autor: $escritor")
        println("Estado: $estado")
        println("----------------------")
    }

    // Obtener nombre del libro
    fun obtenerNombre(): String {
        return nombreLibro
    }

    // Verificar disponibilidad
    fun verificarDisponibilidad(): Boolean {
        return estadoDisponible
    }

    // Prestar libro
    fun realizarPrestamo() {
        if (estadoDisponible) {
            estadoDisponible = false
            println("El libro '$nombreLibro' fue prestado correctamente.")
        } else {
            println("El libro '$nombreLibro' ya se encuentra prestado.")
        }
    }

    // Devolver libro
    fun realizarDevolucion() {
        if (!estadoDisponible) {
            estadoDisponible = true
            println("El libro '$nombreLibro' fue devuelto correctamente.")
        } else {
            println("El libro '$nombreLibro' no estaba prestado.")
        }
    }
}

class SistemaBiblioteca {

    // Lista de libros
    private val listaLibros = mutableListOf<Libros>()

    // Registrar libro
    fun agregarLibro(nuevoLibro: Libros) {
        listaLibros.add(nuevoLibro)
        println("Libro agregado exitosamente.")
    }

    // Mostrar libros disponibles
    fun mostrarLibrosDisponibles() {
        println("=== LIBROS DISPONIBLES ===")

        for (elementoLibro in listaLibros) {
            if (elementoLibro.verificarDisponibilidad()) {
                elementoLibro.mostrarDetalles()
            }
        }
    }

    // Buscar libro por título
    fun buscarLibro(nombreBuscar: String) {
        var encontradoLibro = false

        for (elementoLibro in listaLibros) {

            if (
                elementoLibro.obtenerNombre()
                    .equals(nombreBuscar, ignoreCase = true)
            ) {

                elementoLibro.mostrarDetalles()
                encontradoLibro = true
            }
        }

        if (!encontradoLibro) {
            println("No se encontró el libro.")
        }
    }
}

fun main() {

    // Crear sistema
    val sistema1 = SistemaBiblioteca()

    // Crear libros
    val libroA = Libros(1, "1984", "George Orwell")
    val libroB = Libros(2, "Don Quijote", "Miguel de Cervantes")

    // Registrar libros
    sistema1.agregarLibro(libroA)
    sistema1.agregarLibro(libroB)

    println()

    // Mostrar disponibles
    sistema1.mostrarLibrosDisponibles()

    println()

    // Prestar libro
    libroA.realizarPrestamo()

    println()

    // Intentar prestar nuevamente
    libroA.realizarPrestamo()

    println()

    // Devolver libro
    libroA.realizarDevolucion()

    println()

    // Buscar libro
    sistema1.buscarLibro("1984")
}