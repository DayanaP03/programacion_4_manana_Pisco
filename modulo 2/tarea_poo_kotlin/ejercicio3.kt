open class Vehiculo(
    var marca: String,
    var modelo: String,
    var anio: Int
) {


    open fun mostrarDatos() {
        println("Marca: $marca")
        println("Modelo: $modelo")
        println("Ano: $anio")
    }
}

class Auto(
    marca: String,
    modelo: String,
    anio: Int,
    var numeroPuertas: Int
) : Vehiculo(marca, modelo, anio) {

    override fun mostrarDatos() {
        println("=== Datos del Auto ===")
        println("Marca: $marca")
        println("Modelo: $modelo")
        println("Ano: $anio")
        println("Numero de puertas: $numeroPuertas")
    }
}

class Motocicleta(
    marca: String,
    modelo: String,
    anio: Int,
    var cilindrada: Int
) : Vehiculo(marca, modelo, anio) {

    override fun mostrarDatos() {
        println("=== Datos de la Motocicleta ===")
        println("Marca: $marca")
        println("Modelo: $modelo")
        println("Ano: $anio")
        println("Cilindrada: ${cilindrada}cc")
    }
}

fun main() {

    val auto1 = Auto("Toyota", "Corolla", 2022, 4)
    val moto1 = Motocicleta("Yamaha", "MT-07", 2023, 689)

    
    auto1.mostrarDatos()
    println()
    moto1.mostrarDatos()
}