void configurarHotel({
  required String nombreHotel,
  required int habitaciones,
  bool piscina = false,
  int empleados = 10,
}) {
  final estadoPiscina = piscina ? 'Disponible' : 'No disponible';

  print(
    'Hotel: $nombreHotel | Habitaciones: $habitaciones | Piscina: $estadoPiscina | Empleados: $empleados',
  );
}

void main() {
  configurarHotel(
    nombreHotel: 'Hotel Paraíso',
    habitaciones: 50,
    piscina: true,
    empleados: 25,
  );

  configurarHotel(
    nombreHotel: 'Hotel Sol',
    habitaciones: 20,
  );
}