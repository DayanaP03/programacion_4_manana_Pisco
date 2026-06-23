import 'dart:io';

Map<String, dynamic> calcularMembresia(int plan, int meses) {
  double precioBase;
  double descuentoPct;
  String nombre;

  switch (plan) {
    case 1:
      nombre = 'Basico';
      precioBase = 25.0;
      descuentoPct = 0.0;
      break;
    case 2:
      nombre = 'Estandar';
      precioBase = 40.0;
      descuentoPct = 0.05;
      break;
    case 3:
      nombre = 'Premium';
      precioBase = 65.0;
      descuentoPct = 0.10;
      break;
    case 4:
      nombre = 'Elite';
      precioBase = 90.0;
      descuentoPct = 0.15;
      break;
    default:
      nombre = 'Desconocido';
      precioBase = 0;
      descuentoPct = 0;
  }

  double subtotal = precioBase * meses;
  double descuento = subtotal * descuentoPct;
  double total = subtotal - descuento;

  return {
    'nombre': nombre,
    'precioBase': precioBase,
    'subtotal': subtotal,
    'descuento': descuento,
    'total': total,
  };
}

void main() {
  stdout.write('Plan (1-Basico, 2-Estandar, 3-Premium, 4-Elite): ');
  int plan = int.parse(stdin.readLineSync()!);

  stdout.write('Cantidad de meses a contratar: ');
  int meses = int.parse(stdin.readLineSync()!);

  var r = calcularMembresia(plan, meses);

  print('');
  print('=== RESUMEN DE MEMBRESIA ===');
  print('Plan: ${r["nombre"]}');
  print('Precio mensual: \$${r["precioBase"]!.toStringAsFixed(2)}');
  print('Subtotal: \$${r["subtotal"]!.toStringAsFixed(2)}');
  print('Descuento: \$${r["descuento"]!.toStringAsFixed(2)}');
  print('Total a pagar: \$${r["total"]!.toStringAsFixed(2)}');
}