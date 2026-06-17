void main() {
  saludar();

  print(formatearPrecio(1299.9));
  print(sumar(5, 3));
  print(multiplicar(4, 6));

  imprimirSeparador('Inicio');

  print(formatearPrecio(199.9));
  print(formatearPrecioSinTipo(1299.9));

  print(construirUrl('api.ejemplo.com', '/usuarios'));
  print(construirUrl('api.ejemplo.com', '/usuarios', 8080));
  print(construirUrlV2('api.ejemplo.com', '/productos'));
}

// Funciones correctas 👇

String construirUrl(String dominio, String ruta, [int puerto = 80]) {
  return 'https://$dominio:$puerto$ruta';
}

String construirUrlV2(String dominio, String ruta) {
  return 'https://$dominio:443$ruta';
}

// --- resto correcto ---

void saludar() {
  print('Hello Work');
}

int sumar(int a, int b) {
  return a + b;
}

int multiplicar(int a, int b) => a * b;

void imprimirSeparador(String titulo) {
  print('─── $titulo ───');
}

String formatearPrecio(double precio) =>
    '\$${precio.toStringAsFixed(2)}';

formatearPrecioSinTipo(double precio) =>
    '\$${precio.toStringAsFixed(2)}';