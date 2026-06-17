abstract class AreaHotel {
  String get nombre;
  double calcularProduccion();
}

class Habitacion extends AreaHotel {
  final double habitacionesLimpias;

  Habitacion(this.habitacionesLimpias);

  @override
  String get nombre => 'Habitaciones';

  @override
  double calcularProduccion() => habitacionesLimpias * 12;
}

class Restaurante extends AreaHotel {
  final double platosServidos;

  Restaurante(this.platosServidos);

  @override
  String get nombre => 'Restaurante';

  @override
  double calcularProduccion() => platosServidos * 8;
}

class Recepcion extends AreaHotel {
  final double clientesAtendidos;

  Recepcion(this.clientesAtendidos);

  @override
  String get nombre => 'Recepción';

  @override
  double calcularProduccion() => clientesAtendidos * 5;
}

void imprimirProduccion(AreaHotel area) {
  print(
    '${area.nombre}: ${area.calcularProduccion().toStringAsFixed(2)} puntos',
  );
}

void main() {
  final areas = <AreaHotel>[
    Habitacion(20),
    Restaurante(35),
    Recepcion(15),
  ];

  for (final area in areas) {
    imprimirProduccion(area);
  }

  final mayor = areas.reduce(
    (a, b) =>
        a.calcularProduccion() > b.calcularProduccion() ? a : b,
  );

  print('\nÁrea con mayor producción: ${mayor.nombre}');
}