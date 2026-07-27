// lib/router/app_router_paso2.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/pantalla_inicio.dart';
import '../screens/pantalla_servidores.dart';
import '../screens/pantalla_detalle.dart';
import '../models/servidor_ssh.dart';

final appRouterPaso2 = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path:    '/',
      builder: (context, state) => const PantallaInicio(),
    ),
    GoRoute(
      path:    '/reservas',
      builder: (context, state) => const PantallaServidores(),
      routes: [
        // Ruta hija: /reservas/:id
        GoRoute(
          path:    ':id',   // relativa — ruta completa: /reservas/:id
          builder: (context, state) {
            final id       = state.pathParameters['id']!;
            final reserva = state.extra as ReservaHotel?;
            return PantallaDetalle(id: id, reserva: reserva);
          },
        ),
        // Ruta hija: /reservas/:id/comprobante
        GoRoute(
          path:    ':id/comprobante',
          builder: (context, state) {
            final id = state.pathParameters['id']!;
            return Scaffold(
              appBar: AppBar(title: Text('Comprobante #$id')),
              body:   Center(child: Text('Reserva confirmada para el hotel $id')),
            );
          },
        ),
      ],
    ),
  ],
);