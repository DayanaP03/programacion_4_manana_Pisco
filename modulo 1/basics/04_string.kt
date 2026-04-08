fun main (){
	val nombre ="Dayana"
	val apellido ="Pisco "
	val edad = 19 
    // variable simple 
    println ("Hola $nombre")
    //Expresion
    println ("Nombre Completo : $ {nombre.uppercase()} ${apeliido.uppercase()"})
    println (nombreCompleto)
    println ("Edad : $ {edad+6} años ")
    
       }               
             
/**String Multilinea */

val tarjeta = """
	 |Nombre: $nombre $apellido 
     |Edad : $edad
     |Acceso : ${if (edad>=18) "Permitido" else "Denegado"}
     
     
 """.trimMargin()
 println (tarjeta)
             
            
 