void main() {
  // Conversiones numéricas
  int    entero  = 42;
  // ignore: unused_local_variable
  double decimal = entero.toDouble();   // 42.0
  // ignore: unused_local_variable
  String texto   = entero.toString();   // "42"

  // String → número
  // ignore: unused_local_variable
  int    num1 = int.parse('123');       // 123
  // ignore: unused_local_variable
  double num2 = double.parse('3.14');   // 3.14

  // Conversión segura (no lanza excepción)
  // ignore: unused_local_variable
  int?    num3 = int.tryParse('abc');   // null
  // ignore: unused_local_variable
  double? num4 = double.tryParse('99'); // 99.0

  // Verificar tipo con is (como en Kotlin)
  Object valor = 'texto';
  if (valor is String) {
    print(valor.length);  // smart cast — ya es String
  }

  // Cast explícito con as
  Object obj = 'Hola';
  // ignore: unused_local_variable
  String str = obj as String;

  // Comprobar nulabilidad
  String? nullable = null;
  int longitud = nullable?.length ?? 0;
  print(longitud);  // 0

  // Números especiales
  print(double.infinity);     // Infinity
  print(double.nan);          // NaN
  print(double.maxFinite);    // 1.7976931348623157e+308
}