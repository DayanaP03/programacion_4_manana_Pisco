import 'dart:io';

void main() {
  int cajas = 1;
  int totalCajas = 0;
  int empleados = 0;

  while (cajas > 0) {
    print("Ingrese cantidad de cajas empacadas (0 para terminar): ");

    cajas = int.parse(readLineSync()!);

    if (cajas > 0) {
      empleados++;
      totalCajas += cajas;

      if (cajas < 20) {
        print("Rendimiento bajo");
      } else if (cajas >= 20 && cajas <= 50) {
        print("Rendimiento normal");
      } else {
        print("Rendimiento excelente");
      }
    }

  }
  print("Total de cajas empacadas: $totalCajas");
  print("Cantidad de empleados registrados: $empleados");

  if (empleados > 0) {
    double promedio = totalCajas / empleados;
    print("Promedio de cajas por empleado: $promedio");
  } else {
    print("No se registraron empleados");
  }
}

readLineSync() {
}