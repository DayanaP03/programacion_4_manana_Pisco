abstract class ActividadHotel {
  String get nombre;
  int calcularPuntos();
  double calcularAvance();

  void describir() {
    print(
      '$nombre — Puntos: ${calcularPuntos()}, Avance: ${(calcularAvance() * 100).toStringAsFixed(1)}%',
    );
  }
}

class LimpiezaHabitacion extends ActividadHotel {
  final int habitacionesTotales;
  final int habitacionesLimpias;

  LimpiezaHabitacion(
    this.habitacionesTotales,
    this.habitacionesLimpias,
  );

  @override
  String get nombre => 'Limpieza de Habitaciones';

  @override
  int calcularPuntos() => habitacionesLimpias * 10;

  @override
  double calcularAvance() =>
      habitacionesLimpias / habitacionesTotales;
}

class RegistroHuespedes extends ActividadHotel {
  final int huespedesTotales;
  final int huespedesRegistrados;

  RegistroHuespedes(
    this.huespedesTotales,
    this.huespedesRegistrados,
  );

  @override
  String get nombre => 'Registro de Huéspedes';

  @override
  int calcularPuntos() => huespedesRegistrados * 15;

  @override
  double calcularAvance() =>
      huespedesRegistrados / huespedesTotales;
}

void main() {
  final actividades = <ActividadHotel>[
    LimpiezaHabitacion(20, 16),
    RegistroHuespedes(10, 8),
  ];

  for (final actividad in actividades) {
    actividad.describir();
  }
}