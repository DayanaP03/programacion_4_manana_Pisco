// lib/screens/pantalla_dashboard_reservas.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../providers/reservas_hotel_provider.dart';
import 'pantalla_busqueda_reservas.dart';
import 'pantalla_reservas_hotel.dart';

final indiceTabReservasProvider = StateProvider<int>((ref) => 0);

class PantallaDashboardReservas extends ConsumerWidget {
  const PantallaDashboardReservas({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final indice = ref.watch(indiceTabReservasProvider);

    return Scaffold(
      body: switch (indice) {
        0 => const PantallaReservasHotel(),
        1 => const PantallaBusquedaReservas(),
        2 => const _PanelResumenReservas(),
        _ => const PantallaReservasHotel(),
      },
      bottomNavigationBar: NavigationBar(
        selectedIndex: indice,
        onDestinationSelected: (i) {
          ref.read(indiceTabReservasProvider.notifier).state = i;
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.hotel_outlined),
            selectedIcon: Icon(Icons.hotel),
            label: 'Reservas',
          ),
          NavigationDestination(
            icon: Icon(Icons.search_outlined),
            selectedIcon: Icon(Icons.search),
            label: 'Buscar',
          ),
          NavigationDestination(
            icon: Icon(Icons.assessment_outlined),
            selectedIcon: Icon(Icons.assessment),
            label: 'Resumen',
          ),
        ],
      ),
    );
  }
}

class _PanelResumenReservas extends ConsumerWidget {
  const _PanelResumenReservas();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resumen = ref.watch(resumenReservasProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Resumen de reservas')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _ItemResumen(
              titulo: 'Total reservas',
              valor: resumen.totalReservas.toString(),
              icono: Icons.list_alt,
              color: Colors.blue,
            ),
            const SizedBox(height: 12),
            _ItemResumen(
              titulo: 'Confirmadas',
              valor: resumen.confirmadas.toString(),
              icono: Icons.check_circle,
              color: Colors.green,
            ),
            const SizedBox(height: 12),
            _ItemResumen(
              titulo: 'Pendientes',
              valor: resumen.pendientes.toString(),
              icono: Icons.pending_actions,
              color: Colors.orange,
            ),
            const SizedBox(height: 12),
            _ItemResumen(
              titulo: 'Ingreso estimado',
              valor: 'S/ ${resumen.ingresosEstimados.toStringAsFixed(0)}',
              icono: Icons.attach_money,
              color: Colors.purple,
            ),
          ],
        ),
      ),
    );
  }
}

class _ItemResumen extends StatelessWidget {
  final String titulo;
  final String valor;
  final IconData icono;
  final Color color;

  const _ItemResumen({
    required this.titulo,
    required this.valor,
    required this.icono,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: color.withValues(alpha: 0.15),
              child: Icon(icono, color: color),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                titulo,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            Text(
              valor,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}