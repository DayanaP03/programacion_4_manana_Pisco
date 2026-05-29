class Hotel(
    val numero: Int,          
    var ocupacion: Int,       
    nombre: String            
) {
    val nombreMayus = nombre.uppercase()

    fun aumentar() { ocupacion++ }
    fun resetear() { ocupacion = 0 }
}

fun main() {
    val h = Hotel(101, 50, "suite")

    println(h.numero)        
    println(h.ocupacion)     
    println(h.nombreMayus)   

    h.aumentar()
    println(h.ocupacion)

    h.resetear()
    println(h.ocupacion)
}