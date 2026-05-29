
void saludar() {
  print('Bienvenido al Hotel Paradise');
}


int sumarReservas(int a, int b) {
  return a + b;
}


int calcularHabitaciones(int pisos, int habitacionesPorPiso) =>
    pisos * habitacionesPorPiso;


void imprimirSeparador(String titulo) {
  print('─── $titulo ───');
}

String formatearPrecio(double precio) =>
    '\$${precio.toStringAsFixed(2)}';


formatearPrecioSinTipo(double precio) =>
    '\$${precio.toStringAsFixed(2)}';


String construirUrl(String dominio, String ruta, [int puerto = 80]) {
  return 'https://$dominio:$puerto$ruta';
}


String construirUrlV2(String dominio, String ruta) {
  return 'https://$dominio:443$ruta';
}

void main() {

  saludar();

  imprimirSeparador('Reservas');

  print(formatearPrecio(1299.9));

  print(sumarReservas(5, 3));

  print(calcularHabitaciones(4, 10));

  print(formatearPrecio(199.9));

  print(formatearPrecioSinTipo(1299.9));

  imprimirSeparador('Sistema Web Hotel');

  print(construirUrl('hotelparadise.com', '/reservas', 8080));

  print(construirUrlV2('hotelparadise.com', '/habitaciones'));
}