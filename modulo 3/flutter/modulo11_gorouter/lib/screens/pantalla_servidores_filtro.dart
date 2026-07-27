// lib/screens/pantalla_servidores_filtro.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/servidor_ssh.dart';

class PantallaServidoresFiltro extends StatelessWidget {
  final bool soloDesayuno;
  const PantallaServidoresFiltro({super.key, this.soloDesayuno = false});

  @override
  Widget build(BuildContext context) {
    final filtrados = soloDesayuno
        ? reservasSimuladas.where((r) => r.desayunoIncluido).toList()
        : reservasSimuladas;

    return Scaffold(
      appBar: AppBar(
        title:   Text('Reservas${soloDesayuno ? ' (con desayuno)' : ''}'),
        actions: [
          // Toggle filtro desayuno — cambia la URL con query param
          IconButton(
            icon:    Icon(soloDesayuno ? Icons.free_breakfast : Icons.breakfast_dining),
            tooltip: soloDesayuno ? 'Ver todos' : 'Solo con desayuno',
            onPressed: () => soloDesayuno
                ? context.go('/reservas')
                : context.go('/reservas?soloDesayuno=true'),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount:   filtrados.length,
        itemBuilder: (context, i) {
          final r = filtrados[i];
          return ListTile(
            leading: Icon(
              Icons.hotel,
              color: r.desayunoIncluido ? Colors.green : Colors.grey,
            ),
            title:   Text(r.hotel),
            subtitle: Text('${r.ciudad} • S/ ${r.precioNoche.toStringAsFixed(0)}'),
            onTap: () => context.push(
              '/reservas/${r.id}',
              extra: r,   // pasa el objeto completo
            ),
          );
        },
      ),
    );
  }
}