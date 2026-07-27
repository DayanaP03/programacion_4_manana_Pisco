// lib/screens/pantalla_detalle.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/servidor_ssh.dart';

class PantallaDetalle extends StatelessWidget {
  final String      id;
  final ReservaHotel? reserva; // puede venir por extras

  const PantallaDetalle({super.key, required this.id, this.reserva});

  @override
  Widget build(BuildContext context) {
    // Si no viene por extras, buscar en la lista simulada
    final item = reserva ?? reservasSimuladas.where((r) => r.id == id).firstOrNull;

    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title:           Text('Detalle: ${item?.hotel ?? id}'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: item == null
          ? Center(child: Text('Reserva $id no encontrada'))
          : Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _Fila('Reserva', item.id),
                  _Fila('Hotel', item.hotel),
                  _Fila('Ciudad', item.ciudad),
                  _Fila('Precio/noche', 'S/ ${item.precioNoche.toStringAsFixed(0)}'),
                  _Fila('Puntaje', item.puntaje.toStringAsFixed(1)),
                  _Fila('Desayuno', item.desayunoIncluido ? 'Incluido' : 'No incluido'),
                  const SizedBox(height: 24),
                  Row(children: [
                    OutlinedButton.icon(
                      onPressed: () => context.pop(),
                      icon:  const Icon(Icons.arrow_back),
                      label: const Text('Volver'),
                    ),
                    const SizedBox(width: 12),
                    FilledButton.icon(
                      onPressed: () => context.push('/reservas/${item.id}/comprobante'),
                      icon:  const Icon(Icons.receipt_long),
                      label: const Text('Comprobante'),
                    ),
                  ]),
                ],
              ),
            ),
    );
  }
}

class _Fila extends StatelessWidget {
  final String label;
  final String valor;
  const _Fila(this.label, this.valor);

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(children: [
        SizedBox(
          width: 70,
          child: Text(label,
              style: TextStyle(color: cs.onSurfaceVariant,
                  fontWeight: FontWeight.w600, fontSize: 12)),
        ),
        Text(valor, style: const TextStyle(fontSize: 15)),
      ]),
    );
  }
}