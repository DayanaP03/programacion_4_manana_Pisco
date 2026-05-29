import 'dart:io';

void main() {

  int totalPacientes = 0;
  int cantidad = 0;
  int doctores = 0;
  int horas = 1;

  while (horas > 0) {

    print("Horas trabajadas (0 para terminar): ");
    horas = int.parse(stdin.readLineSync()!);

    if (horas > 0) {

      print("Cantidad de pacientes atendidos: ");
      cantidad = int.parse(stdin.readLineSync()!);

      totalPacientes += cantidad;
      doctores++;

      double pacientesPorHora = cantidad / horas;

      if (pacientesPorHora < 3) {
        print("Atención lenta");
      } else if (pacientesPorHora < 6) {
        print("Atención normal");
      } else {
        print("Atención rápida");
      }
    }
  }

  print("Total de pacientes atendidos: $totalPacientes");
  print("Cantidad de doctores registrados: $doctores");
}