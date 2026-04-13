/**
 * You can edit, run, and share this code.
 * play.kotlinlang.org
 */

fun main() {
    val nombre = "Dayana"
    val apellido = "Pisco"
    val edad = 19

    // variable simple
    println("Hola $nombre")

    // Expresión
    println("Nombre Completo: ${nombre.uppercase()} ${apellido.uppercase()}")

    val nombreCompleto = "$nombre $apellido"
    println(nombreCompleto)

    println("Edad: ${edad + 6} años")

    /** String Multilínea */
    val tarjeta = """
        |Nombre: $nombre $apellido
        |Edad: $edad
        |Acceso: ${if (edad >= 18) "Permitido" else "Denegado"}
    """.trimMargin()

    println(tarjeta)
}
 
             

