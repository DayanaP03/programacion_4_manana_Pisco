// lib/providers/reservas_hotel_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../models/reserva_hotel.dart';

class ReservasHotelNotifier extends Notifier<List<ReservaHotel>> {
  @override
  List<ReservaHotel> build() => [
    ReservaHotel(
      id: 'r1',
      huesped: 'Ana Lopez',
      hotel: 'Hotel Pacifico',
      ciudad: 'Pisco',
      fechaIngreso: DateTime(2026, 8, 2),
      noches: 3,
      habitacion: 'Suite',
      precioPorNoche: 180,
      confirmada: true,
      favorito: true,
    ),
    ReservaHotel(
      id: 'r2',
      huesped: 'Luis Rojas',
      hotel: 'Costa del Sol',
      ciudad: 'Lima',
      fechaIngreso: DateTime(2026, 8, 5),
      noches: 2,
      habitacion: 'Doble',
      precioPorNoche: 140,
      confirmada: true,
    ),
    ReservaHotel(
      id: 'r3',
      huesped: 'Maria Peña',
      hotel: 'Paracas Bay Resort',
      ciudad: 'Paracas',
      fechaIngreso: DateTime(2026, 8, 9),
      noches: 4,
      habitacion: 'Matrimonial',
      precioPorNoche: 210,
      confirmada: false,
    ),
    ReservaHotel(
      id: 'r4',
      huesped: 'Carlos Diaz',
      hotel: 'Hostal Sol y Mar',
      ciudad: 'Ica',
      fechaIngreso: DateTime(2026, 8, 12),
      noches: 1,
      habitacion: 'Simple',
      precioPorNoche: 90,
      confirmada: false,
    ),
  ];

  void toggleFavorito(String id) {
    state = state
        .map((r) => r.id == id ? r.copyWith(favorito: !r.favorito) : r)
        .toList();
  }

  void toggleConfirmada(String id) {
    state = state
        .map((r) => r.id == id ? r.copyWith(confirmada: !r.confirmada) : r)
        .toList();
  }

  void eliminar(String id) {
    state = state.where((r) => r.id != id).toList();
  }

  void agregar(ReservaHotel reserva) {
    state = [...state, reserva];
  }
}

final reservasHotelProvider =
    NotifierProvider<ReservasHotelNotifier, List<ReservaHotel>>(
  ReservasHotelNotifier.new,
);

final busquedaReservaProvider = StateProvider<String>((ref) => '');

final reservasFiltradasProvider = Provider<List<ReservaHotel>>((ref) {
  final reservas = ref.watch(reservasHotelProvider);
  final busqueda = ref.watch(busquedaReservaProvider).trim().toLowerCase();

  if (busqueda.isEmpty) return reservas;

  return reservas.where((r) {
    return r.huesped.toLowerCase().contains(busqueda) ||
        r.hotel.toLowerCase().contains(busqueda) ||
        r.ciudad.toLowerCase().contains(busqueda);
  }).toList();
});

class ResumenReservas {
  final int totalReservas;
  final int confirmadas;
  final int pendientes;
  final double ingresosEstimados;

  const ResumenReservas({
    required this.totalReservas,
    required this.confirmadas,
    required this.pendientes,
    required this.ingresosEstimados,
  });
}

final resumenReservasProvider = Provider<ResumenReservas>((ref) {
  final reservas = ref.watch(reservasHotelProvider);
  final confirmadas = reservas.where((r) => r.confirmada).length;
  final ingresos = reservas
      .where((r) => r.confirmada)
      .fold<double>(0, (acc, r) => acc + r.total);

  return ResumenReservas(
    totalReservas: reservas.length,
    confirmadas: confirmadas,
    pendientes: reservas.length - confirmadas,
    ingresosEstimados: ingresos,
  );
});