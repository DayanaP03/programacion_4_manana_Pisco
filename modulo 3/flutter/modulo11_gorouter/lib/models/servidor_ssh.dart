class ReservaHotel {
  final String id;
  final String hotel;
  final String ciudad;
  final double precioNoche;
  final double puntaje;
  final bool desayunoIncluido;

  const ReservaHotel({
    required this.id,
    required this.hotel,
    required this.ciudad,
    required this.precioNoche,
    required this.puntaje,
    required this.desayunoIncluido,
  });
}

// Lista simulada — en una app real vendria de un provider/API
const reservasSimuladas = [
  ReservaHotel(
    id: '1',
    hotel: 'Mirador del Mar',
    ciudad: 'Paracas',
    precioNoche: 210,
    puntaje: 4.7,
    desayunoIncluido: true,
  ),
  ReservaHotel(
    id: '2',
    hotel: 'Costa Dorada Suites',
    ciudad: 'Pisco',
    precioNoche: 165,
    puntaje: 4.3,
    desayunoIncluido: false,
  ),
  ReservaHotel(
    id: '3',
    hotel: 'Bahia Real Boutique',
    ciudad: 'Ica',
    precioNoche: 240,
    puntaje: 4.8,
    desayunoIncluido: true,
  ),
  ReservaHotel(
    id: '4',
    hotel: 'Arena y Sol Inn',
    ciudad: 'Chincha',
    precioNoche: 130,
    puntaje: 4.0,
    desayunoIncluido: false,
  ),
];