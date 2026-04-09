
fun main() {
  println("Controles de Flujo ")
  println("Condicional If  ")
  println("Incluir temperara en frados centigrados ")
  
  
  val temperatura =readLine()?.toDoubleOrNull()?: 36.5
 
  if(temperatura>=38.0){
      println("Fiebre detectada: derivada consulta prioritaaria ")
  }
    if(temperatura>=40.0){
      println("Fiebre detectada: derivada consulta inmediata  ")
  }
      println("Temperatura registrada: $temperatura grados centigrados  ")

}
****************************************************************************
