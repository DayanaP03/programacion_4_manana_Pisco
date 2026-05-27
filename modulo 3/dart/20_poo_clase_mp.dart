class Habitacion {
  final String id;
  final String numero;
  String tipo;
  bool _disponible = true;

  Habitacion({
    required this.id,
    required this.numero,
    required this.tipo,
  });

  bool get disponible => _disponible;

  String get estado => _disponible ? 'disponible' : 'ocupada';

  set estadoHabitacion(bool valor) {
    _disponible = valor;
    print('Habitación $numero: ${valor ? "disponible" : "ocupada"}');
  }

  void reservar() {
    _disponible = false;
    print('Habitación $numero reservada');
  }

  void liberar() {
    _disponible = true;
    print('Habitación $numero liberada');
  }

  String resumen() =>
      'ID: $id | Número: $numero | Tipo: $tipo | Estado: $estado';

  @override
  String toString() => 'Habitacion($numero, $tipo, $estado)';
}

void main() {

  final habitacion101 = Habitacion(
    id: 'H-001',
    numero: '101',
    tipo: 'Suite',
  );

  habitacion101.reservar();
  print(habitacion101.estado);
  print(habitacion101.resumen());
  print(habitacion101);

  habitacion101.estadoHabitacion = true;
  print(habitacion101.disponible);
}