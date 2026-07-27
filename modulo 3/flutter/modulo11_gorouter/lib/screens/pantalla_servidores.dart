// lib/screens/pantalla_servidores.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/servidor_ssh.dart';

class PantallaServidores extends StatelessWidget {
  const PantallaServidores({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final reservas = reservasSimuladas;

    return Scaffold(
      appBar: AppBar(
        title:           const Text('Reservas disponibles'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: ListView.builder(
        itemCount:   reservas.length,
        itemBuilder: (context, i) => ListTile(
          leading: const Icon(Icons.hotel),
          title:   Text(reservas[i].hotel),
          subtitle: Text(
            '${reservas[i].ciudad} • S/ ${reservas[i].precioNoche.toStringAsFixed(0)} por noche',
          ),
          trailing: Icon(
            reservas[i].desayunoIncluido ? Icons.free_breakfast : Icons.no_food,
            color: reservas[i].desayunoIncluido ? Colors.green : cs.outline,
          ),
          onTap: () {
            // context.push() — apila la pantalla (aparece botón "atrás")
            context.push('/reservas/${reservas[i].id}', extra: reservas[i]);
          },
        ),
      ),
    );
  }
}