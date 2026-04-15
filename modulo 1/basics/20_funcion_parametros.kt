fun main(){
    println ("Funciones -Paremetros por defecto")
    println(crearUsuario("Jhon", 25, "admin", true))
    println(crearUsuario("Luis"))
    println(crearUsuario("Maria", 25))
    println(crearUsuario("Juan", 90, "admin"))
    
    //Argumentos nombrados
    println(crearUsuario(edad=30, nombre="Day", activo=false))
 
}
fun crearUsuario(
nombre: String,
edad: Int=18,
rol: String= "viewer",
activo: Boolean =true 
): String{
    return "Usuario[$nombre, edad=$edad, rol=$rol, activo=$activo]"
    
}
