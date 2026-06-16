void main() {

  var nombreHotel = 'Hotel Paradise';
  var habitacionesDisponibles = 45;
  var precioNoche = 120.50;
  var reservaActiva = true;

  String nombreCliente = 'Dayana Pérez';
  int numeroHabitacion = 305;
  double costoPiscina = 25.75;
  bool servicioVip = false;

  final ciudadHotel = 'Quito';

  const impuesto = 12.0;
  const descuento = 15.5;

  final fechaReserva = DateTime.now();

  print(nombreHotel);
  print(habitacionesDisponibles);
  print(precioNoche);
  print(reservaActiva);

  print(nombreCliente);
  print(numeroHabitacion);
  print(costoPiscina);
  print(servicioVip);

  print(ciudadHotel);

  print(impuesto);
  print(descuento);

  print(fechaReserva);

  print(
    '$nombreCliente tiene reservada la habitación '
    '$numeroHabitacion en $nombreHotel'
  );

  var totalReservas = 0;

  totalReservas = 5;

  print(totalReservas);

  final serviciosHotel = [
    'Piscina',
    'WiFi',
    'Spa'
  ];

  serviciosHotel.add('Restaurante');

  print(serviciosHotel);

  const tiposHabitacion = [
    'Simple',
    'Doble'
  ];

  print(tiposHabitacion);
}