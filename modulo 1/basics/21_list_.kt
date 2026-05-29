fun main() {
    println("Listas - Inmutables")
    val frutas = listOf("manzana", "pera", "uva", "naranja", "mango")
    
    println("Size: ${frutas.size}")
    println("Elemento índice 0: ${frutas[0]}")
    println("Primer elemento: ${frutas.first()}")
    println("Último elemento: ${frutas.last()}")
    
    println("Elemento índice 2: ${frutas.get(2)}")
    println("Índice de 'pera': ${frutas.indexOf("pera")}")
    println("Existe 'pera': ${frutas.contains("pera")}")
    println("'pera' in frutas: ${"pera" in frutas}")
    
    // sublista
    println("Sublista: ${frutas.subList(1, 3)}")
    println("Primeros 2: ${frutas.take(2)}")
    println("Eliminar 3 primeros: ${frutas.drop(3)}")
    println("Últimos 2: ${frutas.takeLast(2)}")
    
    for (fruta in frutas) {
        println(fruta)
    }
    
    println("Lista Mutable")
    val colores = mutableListOf("blanco", "azul", "amarillo", "rojo")
    
    println(colores)
    colores.add("verde")
    println(colores)
    
    colores.add(0, "morado")
    println(colores)
    
    colores.remove("verde")
    println(colores)
    
    colores[1] = "gris"
    println(colores)
    
   println("Array deque")
    val deque =  ArrayDeque<Int>()
    println(deque)
    deque.addFirst(1)
    println(deque)
    deque.addLast(2)
    println(deque)
    deque.addLast(0)
    println(deque)
    deque.removeFirst()
    println(deque)
    deque.removeLast()
    println(deque)
    
    
}