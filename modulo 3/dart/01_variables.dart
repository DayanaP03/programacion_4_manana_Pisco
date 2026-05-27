void main() {
  // var — tipo inferido (como val en Kotlin)
  var nombre = 'Ana';           // String
  var edad   = 28;              // int
  // ignore: unused_local_variable
  var precio = 89.99;           // double
  // ignore: unused_local_variable
  var activo = true;            // bool

  // Tipo explícito
  String apellido = 'García';
  // ignore: unused_local_variable
  int    stock    = 100;
  // ignore: unused_local_variable
  double pi       = 3.14159;
  // ignore: unused_local_variable
  bool   visible  = false;

  // final — no se puede reasignar (como val en Kotlin)
  final ciudad = 'Madrid';
  // ciudad = 'Barcelona';  // ERROR — final no se puede reasignar

  // const — constante en tiempo de compilación (como const en Kotlin)
  // ignore: unused_local_variable
  const gravedad = 9.8;
  // ignore: unused_local_variable
  const pi2      = 3.14159;

  // Diferencia clave: final vs const
  // ignore: unused_local_variable
  final ahora  = DateTime.now();   // OK — se evalúa en runtime
  // const ahora = DateTime.now(); // ERROR — DateTime.now() no es constante de compilación

  print('$nombre $apellido tiene $edad años en $ciudad');


  // var — mutable, tipo inferido
// ignore: unused_local_variable
var contador = 0;
contador = 1;          // OK

// final — inmutable referencia, evaluado en runtime
final lista = [1, 2, 3];
lista.add(4);          // OK — la referencia es final, no el contenido
// lista = [5, 6];     // ERROR — no se puede reasignar la referencia

// const — inmutable profundo, evaluado en compilación
// ignore: unused_local_variable
const colores = ['rojo', 'azul'];
// colores.add('verde'); // ERROR — lista const es completamente inmutable
}