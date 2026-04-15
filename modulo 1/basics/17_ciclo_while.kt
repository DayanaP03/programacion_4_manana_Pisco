fun main(){
    println("Controles de fuñlo interaciones, ciclos repetitivos, ciclo while")
    println("While basico")
    
    var contador =1
    while(contador <=5){
        println(contador)
        contador++
    }
    
}

fun main() {

    println("Ciclos - while")

    // While básico
    var contador = 1
    while (contador <= 5) {
        println(contador)
        contador++
    }

    // Do While
    println("Do While")
    contador = 1
    do {
        println(contador)
        contador++
    } while (contador <= 5)

    // break y continue
    println("break y continue")
    contador = 1
    while (contador <= 10) {
        contador++

        if (contador == 3) continue
        if (contador == 7) break

        println(contador)
    }


    var input: String
    while (true) {
        println("Escribe 'salir' para terminar:")
        input = readLine() ?: ""

        if (input == "salir") break

        println("Usted ingresó: $input")
        
    }
    //repaso
      var input: String
    while (true) {
        println("Escribe 1 para saludar, 2 para sumar , 3 para tabla, 4 salir:")
        input = readLine() ?: ""

        if (input == "1, 2, 3, 4 ") break

        println("Usted ingresó: $input")
    }
}

///// repaso 



fun main() {
      var input: String
      while (true) {
        println("Escribe 1 para saludar, 2 para sumar , 3 para tabla, 4 salir:")
        
        input = readLine() ?: ""
        
     
       when (input){                                     
        "1" -> {
            println("Saludar: $input")
          
        }
        
        "2" -> {
            println("Sumar: $input ")
           
        }
        "3" -> println("Tabla: $input ")
        "4"->   break 
        else ->  println("No existe esa opcion")
        
    
}}
}
