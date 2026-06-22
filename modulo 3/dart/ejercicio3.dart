import 'dart:io';

void main() {
  const int TOTAL = 6;

  double totalInventario = 0;
  int lujo = 0;

  for (int i = 1; i <= TOTAL; i++) {
    stdout.write('Vehiculo $i - Modelo: ');
    String modelo = stdin.readLineSync()!;

    stdout.write('Vehiculo $i - Precio (USD): ');
    double precio = double.parse(stdin.readLineSync()!);

    String segmento;

    if (precio < 15000) {
      segmento = 'Economico';
    } 
    else if (precio <= 30000) {
      segmento = 'Medio';
    } 
    else if (precio <= 60000) {
      segmento = 'Premium';
    } 
    else {
      segmento = 'Lujo';
      lujo++;
    }

    totalInventario += precio;

    print('[$modelo] \$${precio.toStringAsFixed(2)} -> Segmento $segmento');
  }

  print('');
  print('=== RESUMEN DEL INVENTARIO ===');
  print('Valor total del inventario: \$${totalInventario.toStringAsFixed(2)}');
  print('Vehiculos segmento lujo: $lujo de $TOTAL');
}