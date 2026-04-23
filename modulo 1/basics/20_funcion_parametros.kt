    
//fun main(){
    println ("Funciones -Paremetros por defecto")
    println(crearUsuario("Jhon", 25, "admin", true))
    println(crearUsuario("Luis"))
    println(crearUsuario("Maria", 25))
    println(crearUsuario("Juan", 90, "admin"))
    
    //Argumentos nombrados
    println(crearUsuario(edad=30, nombre="Day", activo=false))
 
//}//
fun crearUsuario(
nombre: String,
edad: Int=18,
rol: String= "viewer",
activo: Boolean =true 
): String{
    return "Usuario[$nombre, edad=$edad, rol=$rol, activo=$activo]"
    
}


//ejercicio
fun main() {

    var opcion: Int
    var total = 0.0
    var servicios = 0

    do {
        println("\n1. Servicio  2. Resumen  3. Descuento  0. Salir")
        opcion = readLine()?.toIntOrNull() ?: 0

        when (opcion) {

            1 -> {
                println("1. Consulta(20) 2. Lab(50) 3. Imagen(100)")
                val tipo = readLine()?.toIntOrNull() ?: 0

                val costo = when (tipo) {
                    1 -> 20.0
                    2 -> 50.0
                    3 -> 100.0
                    else -> 0.0
                }

                total += costo
                servicios++
                println("Servicio agregado: $$costo")
            }

            2 -> {
                println("Servicios: $servicios")
                println("Total: $$total")
            }

            3 -> {
                println("Descuento %:")
                val d = (readLine()?.toDoubleOrNull() ?: 0.0) / 100
                total -= total * d
                println("Nuevo total: $$total")
            }

            0 -> println("Total final: $$total")

            else -> println("Opción inválida")
        }

    } while (opcion != 0)
}
