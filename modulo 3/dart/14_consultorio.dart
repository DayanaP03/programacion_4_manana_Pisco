import 'dart:io';

void main() {
  int totalPaciente = 1;
  int cantidad = 0;
  int promedio = 0;
  int horas = 0 ;
    int doctor = 0;
  while (horas > 0) {
    print("Horas trabajadas  ");
    horas = int.parse(readLineSync()!);
    
    print("Cantidad de paciente atendidos  ");
    cantidad = int.parse(readLineSync()!);
    totalPaciente += cantidad;

    pacienteAtendidoPorHora = cantidad / horas  ;
    doctor ++; 


      if (pacienteAtendidoPorHora < 3) {
        print("ATencion Lenta");
      } else if (pacienteAtendidoPorHora < 6) {
        print("Atencion normal");
      } else {
        print("Atencion rapida ");
      }

    }


    print('Total de pacientes atendidos $totalPaciente')
    print('Cantidad de doctores registrados $doctor')
    print('Promedio de pacientes por doctor {totalPaciente / doctor } ')


  }

