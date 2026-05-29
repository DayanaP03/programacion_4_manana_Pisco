fun main() {
    
    println("Escribe tu nombre para poder ser atendido")
    val nombre = readLine() ?: ""

    println("Escribe tu apellido")
    val apellido = readLine() ?: ""

    println("Escribe tu edad")
    val edad = readLine() ?: ""

    println("Escribe en que ciudad te encuentras")
    val ciudad = readLine() ?: ""

    val saludo = crearSaludo(nombre, apellido, ciudad)
    println(saludo)
}

fun crearSaludo(nombre: String, apellido: String, ciudad: String): String {
    return "Hola $nombre $apellido, nos alegra que te encuentres en $ciudad. Pronto seras atendido por un asesor "
}
/*
 Comentarios multilínea

 // Comentario de una sola línea

 Documentación:
 @param nombre de usuario
 @return un saludo personalizado
*/