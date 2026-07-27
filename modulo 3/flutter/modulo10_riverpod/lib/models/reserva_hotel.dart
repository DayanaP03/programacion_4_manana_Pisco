// lib/models/reserva_hotel.dart
class ReservaHotel {
  final String id;
  final String huesped;
  final String hotel;
  final String ciudad;
  final DateTime fechaIngreso;
  final int noches;
  final String habitacion;
  final double precioPorNoche;
  final bool confirmada;
  final bool favorito;

  const ReservaHotel({
    required this.id,
    required this.huesped,
    required this.hotel,
    required this.ciudad,
    required this.fechaIngreso,
    required this.noches,
    required this.habitacion,
    required this.precioPorNoche,
    this.confirmada = false,
    this.favorito = false,
  });

  double get total => noches * precioPorNoche;

  ReservaHotel copyWith({
    String? id,
    String? huesped,
    String? hotel,
    String? ciudad,
    DateTime? fechaIngreso,
    int? noches,
    String? habitacion,
    double? precioPorNoche,
    bool? confirmada,
    bool? favorito,
  }) {
    return ReservaHotel(
      id: id ?? this.id,
      huesped: huesped ?? this.huesped,
      hotel: hotel ?? this.hotel,
      ciudad: ciudad ?? this.ciudad,
      fechaIngreso: fechaIngreso ?? this.fechaIngreso,
      noches: noches ?? this.noches,
      habitacion: habitacion ?? this.habitacion,
      precioPorNoche: precioPorNoche ?? this.precioPorNoche,
      confirmada: confirmada ?? this.confirmada,
      favorito: favorito ?? this.favorito,
    );
  }
}