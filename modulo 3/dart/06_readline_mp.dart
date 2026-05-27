import 'dart:io';

void main() {

  print('Ingrese el nombre del cliente:');

  String? nombreCliente = stdin.readLineSync();

  print('Bienvenido $nombreCliente');


  print('Ingrese el número de habitación:');

  int numeroHabitacion =
      int.parse(stdin.readLineSync()!);

  print('Habitación seleccionada: $numeroHabitacion');


  print('Ingrese el precio por noche:');

  double precioNoche =
      double.parse(stdin.readLineSync()!);

  print('Precio registrado: $precioNoche');


  print('Ingrese la cantidad de noches:');

  int noches =
      int.parse(stdin.readLineSync()!);

  print('Ingrese el costo adicional de servicios:');

  double servicios =
      double.parse(stdin.readLineSync()!);

  double totalReserva =
      (precioNoche * noches) + servicios;

  print('Total a pagar: $totalReserva');
}