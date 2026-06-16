import 'dart:io';

void main() {

  int habitacionesOcupadas = 1;
  int totalHabitaciones = 0;
  int recepcionistas = 0;

  while (habitacionesOcupadas > 0) {

    print("Ingrese cantidad de habitaciones ocupadas (0 para terminar): ");

    habitacionesOcupadas = int.parse(stdin.readLineSync()!);

    if (habitacionesOcupadas > 0) {

      recepcionistas++;
      totalHabitaciones += habitacionesOcupadas;

      if (habitacionesOcupadas < 20) {
        print("Baja ocupación del hotel");
      } else if (habitacionesOcupadas <= 50) {
        print("Ocupación normal");
      } else {
        print("Alta ocupación del hotel");
      }
    }
  }

  print("Total de habitaciones ocupadas: $totalHabitaciones");
  print("Cantidad de recepcionistas registrados: $recepcionistas");

  if (recepcionistas > 0) {

    double promedio = totalHabitaciones / recepcionistas;

    print("Promedio de ocupación por recepcionista: $promedio");
  } else {

    print("No se registraron datos de recepción");
  }
}