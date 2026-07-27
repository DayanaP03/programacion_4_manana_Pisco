// lib/screens/pantalla_busqueda_reservas.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/reservas_hotel_provider.dart';

class PantallaBusquedaReservas extends ConsumerWidget {
  const PantallaBusquedaReservas({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reservas = ref.watch(reservasFiltradasProvider);
    final busqueda = ref.watch(busquedaReservaProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Buscar reservas')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: SearchBar(
              hintText: 'Buscar por huesped, hotel o ciudad...',
              leading: const Icon(Icons.search),
              trailing: busqueda.isNotEmpty
                  ? [
                      IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          ref.read(busquedaReservaProvider.notifier).state = '';
                        },
                      ),
                    ]
                  : null,
              onChanged: (value) {
                ref.read(busquedaReservaProvider.notifier).state = value;
              },
              padding: const WidgetStatePropertyAll(
                EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
          ),
          Expanded(
            child: reservas.isEmpty
                ? const Center(child: Text('Sin resultados'))
                : ListView.builder(
                    itemCount: reservas.length,
                    itemBuilder: (_, i) {
                      final r = reservas[i];
                      return ListTile(
                        leading: const Icon(Icons.hotel),
                        title: Text(r.huesped),
                        subtitle: Text('${r.hotel} - ${r.ciudad}'),
                        trailing: Text(
                          r.confirmada ? 'Confirmada' : 'Pendiente',
                          style: TextStyle(
                            color: r.confirmada ? Colors.green : Colors.orange,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}