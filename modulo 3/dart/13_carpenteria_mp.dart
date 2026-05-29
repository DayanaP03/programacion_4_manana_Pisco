import 'dart:io';

void main() {

  int horasCheckIn = 1;
  int habitacionesAsignadas = 0;
  int recepcionistas = 0;

  while (horasCheckIn > 0) {

    print("Ingrese horas de check-in (0 para terminar): ");

    horasCheckIn = int.parse(stdin.readLineSync()!);

    print("Ingrese cantidad de habitaciones asignadas: ");

    habitacionesAsignadas = int.parse(stdin.readLineSync()!);

    if (horasCheckIn > 0) {

      recepcionistas++;
      habitacionesAsignadas += horasCheckIn;

      if (habitacionesAsignadas < 2) {
        print("Baja ocupación del hotel");
      } else if (habitacionesAsignadas <= 4) {
        print("Ocupación normal");
      } else {
        print("Alta ocupación del hotel");
      }
    }
  }

  print("Total de habitaciones asignadas: $habitacionesAsignadas");
  print("Cantidad de recepcionistas registrados: $recepcionistas");

  if (recepcionistas > 0) {

    double promedio = habitacionesAsignadas / recepcionistas;

    print("Promedio de habitaciones por recepcionista: $promedio");

  } else {

    print("No se registraron recepcionistas");
  }
}