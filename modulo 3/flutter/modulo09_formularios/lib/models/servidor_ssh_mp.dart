class HabitacionHotel {
  final String id;
  final String nombre;
  final String ubicacion;
  final int piso;
  final String tipoBed;
  final bool wifiGratis;
  bool favorito;

  HabitacionHotel({
    required this.id,
    required this.nombre,
    required this.ubicacion,
    required this.piso,
    required this.tipoBed,
    required this.wifiGratis,
    this.favorito = false,
  });
}