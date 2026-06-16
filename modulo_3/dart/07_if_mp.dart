import 'dart:io';

void main() {

  print('Ingrese una temperatura:');
  int temperatura = int.parse(stdin.readLineSync()!);

  if (temperatura > 37) {
    print('Fiebre');
  } else if (temperatura > 0) {
    print('Normal');
  } else {
    print('Hipotermia');
  }

  String estado = temperatura > 37 ? 'Con fiebre' : 'Sin fiebre';
  print(estado);

  print('Ingrese un número:');
  String? numeroTexto = stdin.readLineSync();

  print('Número ingresado: $numeroTexto');

  print('Ingrese un número negativo:');
  // ignore: unused_local_variable
  int numeroNegativo = int.parse(stdin.readLineSync()!);

  print('Ingrese un número decimal:');
  // ignore: unused_local_variable
  double valorDecimal = double.parse(stdin.readLineSync()!);

  print('Ingrese otro número:');
  int numeroExtra = int.parse(stdin.readLineSync()!);

  print('Ingrese un número cero:');
  // ignore: unused_local_variable
  int numeroCero = int.parse(stdin.readLineSync()!);

  if (numeroExtra > 0) {
    print('Número positivo');
  } else if (numeroExtra == 0) {
    print('Número cero');
  } else {
    print('Número negativo');
  }

  String? nombre;

  // ignore: dead_code
  print(nombre?.length);

  // ignore: dead_code
  int longitud = nombre?.length ?? 0;
  print(longitud);
}