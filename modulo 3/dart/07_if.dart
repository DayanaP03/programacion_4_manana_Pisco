// ignore_for_file: dead_code

import 'dart:io';

void main() {


  int temperatura = 38;

  if (temperatura > 37.5) {
    print('Fiebre');
  } else if (temperatura > 36) {
    print('Normal');
  } else {
    print('Hipotermia');
  }

  String estado = temperatura > 37.5 ? 'Con fiebre' : 'Sin fiebre';
  print(estado);

  String? ciudad;
  print(ciudad?.toUpperCase() ?? 'Sin ciudad');



  print('Ingresa un número: ');
  int numero = int.parse(stdin.readLineSync()!);

  print('Hola $numero');

  print('Número negativo: ');
  int numer = int.parse(stdin.readLineSync()!);
  print('Número $numer');

  print('Número positivo: ');
  double valor = double.parse(stdin.readLineSync()!);
  print('Valor $valor');

  print('Número cero: ');
  double valor2 = double.parse(stdin.readLineSync()!);
  print('Valor $valor2');

  // CORRECTO: ahora sí comparas int
  if (numero >= 1) {
    print('Número positivo');
  } else if (numero == 0) {
    print('Número cero');
  } else {
    print('Número negativo');
  }




  String? nombre;

  // ignore: unnecessary_null_comparison
  if (nombre != null) {
    print(nombre.length);
  }

  print(nombre?.length);

  int longitud = nombre?.length ?? 0;
  print(longitud);
}