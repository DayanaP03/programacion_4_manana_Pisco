void main() {

  final preciosHabitaciones = [80.0, 120.0, 150.0, 200.0];

  final preciosConIVA = preciosHabitaciones.map((p) => p * 1.15);
  print(preciosConIVA.toList());

  final serviciosHotel = ['/wifi', '/piscina', '/spa'];

  final urlsServicios =
      serviciosHotel.map((s) => 'https://hotelparadise.com$s');

  print(urlsServicios.toList());

  final ocupacionHotel = [35, 40, 55, 60, 30, 80];

  final ocupacionAlta =
      ocupacionHotel.where((o) => o > 50);

  print(ocupacionAlta.toList());

  final ocupacionNormal =
      ocupacionHotel.where((o) => o >= 30 && o <= 50);

  print(ocupacionNormal.toList());
}