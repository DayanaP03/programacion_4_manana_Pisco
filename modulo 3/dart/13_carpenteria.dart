import 'dart:io';

void main() {
  int horasTrabajadas= 1;
  int cantidadsillas = 0;
  int empledado = 0; 

  while (horasTrabajadas > 0) {
    print("Ingrese cantidad de cajas empacadas (0 para terminar): ");

    horasTrabajadas = int.parse(readLineSync()!);
    cantidadsillas int.parse(readLineSync()!);

    if (cantidadsillas > 2) {
      horasTrabajadas++;
      cantidadsillas += horasTrabajadas ;

      if (cantidadsillas < 2) {
        print("Produccion baja");
      } else if (cantidadsillas >= 4 ) {
        print("Produccion normal ");
      } else {
        print("Produccion alta ");
      }
    }

  }
  print("Total de cajas empacadas: $cantidadsillas");
  print("Cantidad de empleados registrados: $horasTrabajadas");

  if (horasTrabajadas > 0) {
    double empleado = horasTrabajadas / cantidad;
    print("Promedio de cajas por empleado: $promedio");
  } else {
    print("No se registraron empleados");
  }

}