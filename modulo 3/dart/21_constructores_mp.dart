class HabitacionHotel {
  final String id;
  final String numero;
  final String tipo;
  final bool vistaAlMar;

  HabitacionHotel({
    required this.id,
    required this.numero,
    required this.tipo,
    this.vistaAlMar = false,
  });

  HabitacionHotel.simple()
      : id = 'H-000',
        numero = '000',
        tipo = 'Estandar',
        vistaAlMar = false;

  HabitacionHotel.lujo({
    required this.id,
    required this.numero,
  })  : tipo = 'Suite',
        vistaAlMar = true;

  factory HabitacionHotel.desdeCodigo(String codigo) {
    final partes = codigo.split('-');

    return HabitacionHotel(
      id: codigo,
      numero: partes.length > 1 ? partes[1] : '000',
      tipo: 'Estandar',
      vistaAlMar: codigo.contains('VIP'),
    );
  }

  @override
  String toString() =>
      'Habitación $numero | Tipo: $tipo | Vista al mar: $vistaAlMar';
}

void main() {

  final h1 = HabitacionHotel(
    id: 'H-101',
    numero: '101',
    tipo: 'Estandar',
  );

  final h2 = HabitacionHotel.simple();

  final h3 = HabitacionHotel.lujo(
    id: 'H-900',
    numero: '900',
  );

  final h4 = HabitacionHotel.desdeCodigo('VIP-305');

  print(h1);
  print(h2);
  print(h3);
  print(h4);
}