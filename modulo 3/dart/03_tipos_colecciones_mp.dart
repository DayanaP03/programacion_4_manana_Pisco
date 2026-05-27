void main() {

  List<String> habitaciones = [
    'Simple',
    'Doble',
    'Suite'
  ];

  var numerosHabitacion = [
    101,
    102,
    103,
    104
  ];

  print(habitaciones[0]);

  print(habitaciones.length);

  habitaciones.add('Presidencial');

  habitaciones.remove('Doble');

  print(habitaciones);

  Map<String, int> reservas = {
    'Dayana': 3,
    'Carlos': 5,
    'María': 2,
  };

  print(reservas['Dayana']);

  print(reservas['Pedro']);

  reservas['Lucía'] = 4;

  print(reservas);

  Set<String> servicios = {
    'WiFi',
    'Piscina',
    'Spa'
  };

  servicios.add('WiFi');

  print(servicios.length);

  print(servicios);

  var piso1 = [101, 102, 103];

  var piso2 = [201, 202, 203];

  var habitacionesHotel = [
    ...piso1,
    ...piso2
  ];

  print(habitacionesHotel);

  bool mostrarSuite = true;

  var tiposHabitacion = [
    'Simple',
    'Doble',
    if (mostrarSuite) 'Suite',
  ];

  print(tiposHabitacion);

  var precios = [
    for (var i = 1; i <= 5; i++) i * 50
  ];

  print(precios);

  print(numerosHabitacion);
}