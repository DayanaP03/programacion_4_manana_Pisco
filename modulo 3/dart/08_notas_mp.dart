import 'dart:io';

void main() {

  int calificacionServicio = 10;

  if (calificacionServicio >= 7) {
    print('Servicio del hotel: Aprobado');
  } else {
    print('Servicio del hotel: Reprobado');
  }

  String estadoServicio =
      calificacionServicio >= 7 ? 'Servicio bueno' : 'Servicio deficiente';

  print(estadoServicio);

  print('Ingrese calificación del servicio del hotel:');

  int notaHotel =
      int.parse(stdin.readLineSync()!);

  if (notaHotel >= 7) {
    print('El huésped está satisfecho con el hotel');
  } else {
    print('El huésped no está satisfecho con el hotel');
  }

  String resultado =
      notaHotel >= 7 ? 'Satisfacción alta' : 'Satisfacción baja';

  print(resultado);
}