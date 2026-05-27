void main() {

  int habitacionesDisponibles = 0;

  var solicitudesReserva;

  while (solicitudesReserva > 0) {

    final asignacion =
        solicitudesReserva > 5 ? 5 : solicitudesReserva;

    habitacionesDisponibles++;

    solicitudesReserva -= asignacion;

    print(
      'Reserva ${habitacionesDisponibles}: $asignacion habitaciones asignadas '
      '(restantes: $solicitudesReserva)'
    );
  }

  int intentosCheckIn = 0;
  bool checkInExitoso = false;

  do {

    intentosCheckIn++;

    print('Intento de check-in #$intentosCheckIn...');

    if (intentosCheckIn == 3) {
      checkInExitoso = true;
    }

  } while (!checkInExitoso && intentosCheckIn < 5);

  print(
    checkInExitoso
        ? 'Check-in completado tras $intentosCheckIn intentos'
        : 'No se pudo completar el check-in'
  );
}