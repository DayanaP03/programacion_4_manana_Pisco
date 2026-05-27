
//Saludar sin parametro 
void saludar() {
  print('Hello Work ');
}


// Sintaxis completa — preferida para funciones públicas
int sumar(int a, int b) {
  return a + b;
}

// Sintaxis de flecha — cuando el cuerpo es una sola expresión
int multiplicar(int a, int b) => a * b;

// void — cuando no se devuelve nada
void imprimirSeparador(String titulo) {
  print('─── $titulo ───');
}


// Dart puede inferir el tipo de retorno, pero es buena práctica declararlo
// explícitamente en funciones públicas para mejorar la legibilidad.

// Con tipo explícito — recomendado
String formatearPrecio(double precio) => '\$${precio.toStringAsFixed(2)}';

// Sin tipo — Dart infiere que retorna String
formatearPrecioSinTipo(double precio) => '\$${precio.toStringAsFixed(2)}';

void main() {
  saludar();
  print(formatearPrecio(1299.9));  // $1299.90
  print(sumar(5, 3));   
         // 8
  print(multiplicar(4, 6));    // 24
  imprimirSeparador('Inicio'); // ─── Inicio ───

  print(formatearPrecio(199.9));
  print(formatearPrecioSinTipo(1299.9));

 print(construirUrl('api.ejemplo.com', '/usuarios'));          // https://api.ejemplo.com/usuarios
  print(construirUrl('api.ejemplo.com', '/usuarios', 8080));   // https://api.ejemplo.com:8080/usuarios
  print(construirUrlV2('api.ejemplo.com', '/productos'));       // https://api.ejemplo.com:443/productos
}

Object? construirUrlV2(String s, String t) {
}

Object? construirUrl(String s, String t, int i) {
}
