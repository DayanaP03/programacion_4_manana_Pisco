int calcularHabitaciones(int n) => n * 2;
int calcularClientes(int n) => n * 3;

void main() {
  int Function(int) operacion;

  operacion = calcularHabitaciones;
  print(operacion(5));

  operacion = calcularClientes;
  print(operacion(5));

  final procesos = <int Function(int)>[
    calcularHabitaciones,
    calcularClientes,
  ];

  for (final fn in procesos) {
    print(fn(10));
  }
}