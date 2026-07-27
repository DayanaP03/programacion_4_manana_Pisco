// lib/screens/pantalla_reservas_hotel.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/reserva_hotel.dart';
import '../providers/reservas_hotel_provider.dart';

class PantallaReservasHotel extends ConsumerWidget {
  const PantallaReservasHotel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reservas = ref.watch(reservasHotelProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Reservas de Hotel (${reservas.length})'),
      ),
      body: reservas.isEmpty
          ? const Center(child: Text('No hay reservas registradas'))
          : ListView.separated(
              itemCount: reservas.length,
              separatorBuilder: (_, _) =>
                  const Divider(height: 1, indent: 72, endIndent: 16),
              itemBuilder: (context, i) {
                final r = reservas[i];

                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor:
                        r.confirmada ? Colors.green.shade50 : Colors.orange.shade50,
                    child: Icon(
                      r.confirmada ? Icons.check : Icons.schedule,
                      color: r.confirmada ? Colors.green : Colors.orange,
                    ),
                  ),
                  title: Text(
                    r.huesped,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    '${r.hotel} - ${r.ciudad}\n${r.habitacion} - ${r.noches} noche(s)',
                  ),
                  isThreeLine: true,
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('S/ ${r.total.toStringAsFixed(0)}'),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(
                              r.favorito ? Icons.star : Icons.star_border,
                              color: r.favorito ? Colors.amber : null,
                            ),
                            tooltip: 'Favorito',
                            onPressed: () {
                              ref
                                  .read(reservasHotelProvider.notifier)
                                  .toggleFavorito(r.id);
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete_outline, color: Colors.red),
                            tooltip: 'Eliminar',
                            onPressed: () {
                              ref.read(reservasHotelProvider.notifier).eliminar(r.id);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  onTap: () {
                    ref.read(reservasHotelProvider.notifier).toggleConfirmada(r.id);
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          final id = DateTime.now().millisecondsSinceEpoch.toString();
          final total = reservas.length;

          ref.read(reservasHotelProvider.notifier).agregar(
                ReservaHotel(
                  id: id,
                  huesped: 'Huesped $total',
                  hotel: total.isEven ? 'Hotel Pacifico' : 'Paracas Bay Resort',
                  ciudad: total.isEven ? 'Pisco' : 'Paracas',
                  fechaIngreso: DateTime.now().add(Duration(days: total + 1)),
                  noches: (total % 4) + 1,
                  habitacion: total.isEven ? 'Doble' : 'Suite',
                  precioPorNoche: total.isEven ? 130 : 190,
                ),
              );
        },
        icon: const Icon(Icons.add),
        label: const Text('Nueva reserva'),
      ),
    );
  }
}