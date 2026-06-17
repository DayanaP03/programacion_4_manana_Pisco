import 'dart:io';

void main() {

  int totalHuespedes = 0;
  int cantidad = 0;
  int recepcionistas = 0;
  int horasCheckIn = 1;

  while (horasCheckIn > 0) {

    print("Horas de check-in (0 para terminar): ");
    horasCheckIn = int.parse(stdin.readLineSync()!);

    if (horasCheckIn > 0) {

      print("Cantidad de huéspedes registrados: ");
      cantidad = int.parse(stdin.readLineSync()!);

      totalHuespedes += cantidad;
      recepcionistas++;

      double huespedesPorHora = cantidad / horasCheckIn;

      if (huespedesPorHora < 3) {
        print("Check-in lento");
      } else if (huespedesPorHora < 6) {
        print("Check-in normal");
      } else {
        print("Check-in rápido");
      }
    }
  }

  print("Total de huéspedes registrados: $totalHuespedes");
  print("Cantidad de recepcionistas: $recepcionistas");
}