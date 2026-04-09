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
  
 
  