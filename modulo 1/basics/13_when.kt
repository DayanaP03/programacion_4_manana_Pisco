// Online Kotlin compiler to run Kotlin program online
// Print "Try programiz.pro" message

fun main() {

  println ("Usuario ingreso los minutos trascurridos ")
  println ("Escriba el codigo  ")
  val codigo =readLine()?.toInOrNull()?:0
  
  val especialidad = when(codigo){
      1 ->"Medicina General"
      2 ->"Pediatria"
      3 ->"Cardiologia"
      4 ->"Ginecologia"
      5 ->"Neurologia"
      6 ->"Dermatologia"
      else -> "Especialidad no registrada en el sistema "
  }
  println ("Especilidad: $especialidad")
  
}


fun main() {
  println("Muestra de laboratorio con codigo ")
  println("Escribe el codigo ")
  val codigo =readLine()?.toIntOrNull()?:0
  
  val muestra =when(codigo)
  {
      1->"Sangre Venenosa tiempo 4h"
      2-> "Orina tiempo 2h"
      3-> "Heces tiempo 24h"
      4->"Hisopado nasfaringeo tiempo 6h"
      5->"Biopsia tiempo 72 h"
      else -> "Esecilidad no registrada"

    }
    
    println("Especialidad:$muestra")
    
      
  
}
  