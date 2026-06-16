void main() {

  int numeroHabitacion = 305;

  double precioHabitacion =
      numeroHabitacion.toDouble();

  String codigoHabitacion =
      numeroHabitacion.toString();

  print(precioHabitacion);

  print(codigoHabitacion);

  int diasReserva =
      int.parse('5');

  double costoReserva =
      double.parse('250.75');

  print(diasReserva);

  print(costoReserva);

  int? habitacionesDisponibles =
      int.tryParse('abc');

  double? descuentoHotel =
      double.tryParse('15.5');

  print(habitacionesDisponibles);

  print(descuentoHotel);

  Object cliente = 'Dayana Pérez';

  if (cliente is String) {

    print(cliente.length);
  }

  Object reserva = 'Reserva Confirmada';

  String mensajeReserva =
      reserva as String;

  print(mensajeReserva);

  String? codigoPromo = null;

  int longitudCodigo =
      codigoPromo?.length ?? 0;

  print(longitudCodigo);

  print(double.infinity);

  print(double.nan);

  print(double.maxFinite);
}