import 'dart:io';

double tarifaPorCategoria(int cat) {
  if (cat == 1) return 45.0;
  else if (cat == 2) return 75.0;
  else if (cat == 3) return 130.0;
  else if (cat == 4) return 220.0;
  else return 0.0;
}

void main() {
  double totalRecaudado = 0;
  int altoValor = 0;
  int totalReservas = 0;

  print('=== SISTEMA DE RESERVAS HOTEL ===');
  print('(Ingrese 0 noches para finalizar)');
  print('');

  stdout.write('Reserva ${totalReservas + 1} - Noches: ');
  int noches = int.parse(stdin.readLineSync()!);

  while (noches != 0) {
    stdout.write('Categoria habitacion (1-4): ');
    int cat = int.parse(stdin.readLineSync()!);

    double tarifa = tarifaPorCategoria(cat);
    double total = tarifa * noches;

    totalReservas++;
    totalRecaudado += total;

    if (total > 300) {
      altoValor++;
    }

    print('Tarifa/noche: \$${tarifa.toStringAsFixed(2)} | Total: \$${total.toStringAsFixed(2)}');
    print('');

    stdout.write('Reserva ${totalReservas + 1} - Noches: ');
    noches = int.parse(stdin.readLineSync()!);
  }

  String estado = totalRecaudado > 3000 ? 'Ocupacion alta' : 'Ocupacion normal';

  print('=== INFORME DE CIERRE ===');
  print('Total reservas atendidas: $totalReservas');
  print('Total recaudado: \$${totalRecaudado.toStringAsFixed(2)}');
  print('Reservas de alto valor: $altoValor');
  print('Estado de ocupacion: $estado');
}