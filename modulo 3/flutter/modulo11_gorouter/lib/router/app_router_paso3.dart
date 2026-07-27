// lib/router/app_router_paso3.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/pantalla_inicio.dart';
import '../screens/pantalla_servidores_filtro.dart';
import '../screens/pantalla_detalle.dart';
import '../models/servidor_ssh.dart';

final appRouterPaso3 = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path:    '/',
      builder: (context, state) => const PantallaInicio(),
    ),
    GoRoute(
      path:    '/reservas',
      builder: (context, state) {
        // Query parameters — /reservas?soloDesayuno=true
        final soloDesayuno = state.uri.queryParameters['soloDesayuno'] == 'true';
        return PantallaServidoresFiltro(soloDesayuno: soloDesayuno);
      },
    ),
    GoRoute(
      path:    '/reservas/:id',
      builder: (context, state) {
        final id       = state.pathParameters['id']!;
        final reserva = state.extra as ReservaHotel?;
        return PantallaDetalle(id: id, reserva: reserva);
      },
    ),
    GoRoute(
      path:    '/reservas/:id/comprobante',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return Scaffold(
          appBar: AppBar(title: Text('Comprobante #$id')),
          body:   Center(child: Text('Tu reserva #$id esta confirmada.')),
        );
      },
    ),
  ],
);