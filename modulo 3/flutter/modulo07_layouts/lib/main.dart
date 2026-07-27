import 'package:flutter/material.dart';
import 'widgets/fila_estado_mp.dart'; // Importa el widget creado arriba

void main() {
  runApp(const FilaEstadoMp(
    nombre: 'Suite Presidencial 402',
    detalle: 'Vista al mar · 2 camas King',
    activo: true,
  ));
}

class FilaEstadoMp extends StatelessWidget {
  const FilaEstadoMp({super.key, required this.nombre, required this.detalle, required this.activo});

  final String nombre;
  final String detalle;
  final bool activo;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Filas de Estado Hotel App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0E0E0E),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFFF007F),
          primaryContainer: Color(0xFF1A1A1A),
          secondary: Color(0xFF03DAC6),
          surface: Color(0xFF121212),
          error: Color(0xFFCF6679),
        ),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Estado de Habitaciones'),
          backgroundColor: const Color(0xFF1A1A1A),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: const [
            FilaEstadoMp(
              nombre: 'Suite Presidencial 402',
              detalle: 'Vista al mar · 2 camas King',
              activo: true,
            ),
            FilaEstadoMp(
              nombre: 'Habitación Doble 205',
              detalle: 'Check-out pendiente · 1 cama Queen',
              activo: false,
            ),
            FilaEstadoMp(
              nombre: 'Habitación Deluxe 310',
              detalle: 'Balcón privado · Sin restricciones',
              activo: true,
            ),
          ],
        ),
      ),
    );
  }
}