void main() {

  String nombreHotel = 'Hotel Paradise';

  String? nombreCliente = null;

  nombreCliente = 'Dayana Pérez';

  String? ciudadHotel = 'Quito';

  print(ciudadHotel.length);

  // ignore: dead_code, dead_null_aware_expression
  String resultadoCiudad = ciudadHotel ?? 'Sin ciudad';

  print(resultadoCiudad);

  // ignore: unnecessary_non_null_assertion
  String ciudadSegura = ciudadHotel!;

  print(ciudadSegura);

  // ignore: unnecessary_null_comparison
  if (nombreCliente != null) {

    print(nombreCliente.length);
  }

  late String codigoReserva;

  codigoReserva = 'RSV2026';

  print(codigoReserva);

  print(nombreHotel);
}