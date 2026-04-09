// Online Kotlin compiler to run Kotlin program online
// Print "Try programiz.pro" message

fun main() {
  println("Controles de Flujo  ")
  println("Concional if - Multiples condicionales  ")
  println("Presion sistolica mmHg ")
  val sistolica = readLine()?.toIntOrNull() ?:0
  
  val clasificacion = if (sistolica <= 90){
      "Hipotension"
      
  } else if(sistolica <= 119){
      "Normal"
 

  } else if(sistolica <= 129){
      "Elevada"
  
        
  } else if(sistolica <= 139){
      "Hipertensio Grado 1"
      
  } else if (sistolica <= 179){
      "Hipertension Grado 2 "
      
 
        
  } else{
      "Crisis Hepertensiva "
  } 
  
    println("Clasificacion: $clasificacion.uppercase()")
    println("Clasificacion: $clasificacion.uppercase()")  
    
  
  
}
    
      
  
  