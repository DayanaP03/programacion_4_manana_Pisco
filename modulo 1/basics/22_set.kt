// Online Kotlin compiler to run Kotlin program online
// Print "Try programiz.pro" message

fun main() {
  println("Set")
  val numeros = setOf(1,2,3,4,8,4,1,3)
  println("numeros set: ${numeros}")

  println("Operaciones de conjuntos")
  val pares = setOf(2,4,6,8,10)
  val multiplo3 = setOf(3,6,8,12)
  println("pares set : ${pares}")
  println("multiples de 3 set : ${multiplo3}")
  println("union: ${pares union multiplo3}")
   println("interseccion : ${pares intersect multiplo3}")
  println("subtraccion: ${pares subtract multiplo3}")
   println("pares set : ${pares}")
  println("multilplo3 set: ${multiplo3}")
  
  println("Ser mutable ")
  val tags = mutableSetOf("kotlin", "java", "reactnative")
  println(tags)
  tags.add("kotlin")
  println(tags)
  tags.add("javascript")
  println(tags)
  tags.remove("java")
  println(tags)
  println("verificar si el elemento existe ${"kotlin" in tags}")
  println("verificar si el elemento existe ${"java" in tags}")  
}