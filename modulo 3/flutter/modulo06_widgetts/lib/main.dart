import 'package:flutter/material.dart';
import 'widgets/servicio_estado_mp.dart'; // Importa el widget creado arriba

void main() {
  runApp(const ServicioEstadoMp(nombre: 'Suite Deluxe #302'));
}

class ServicioEstadoMp extends StatelessWidget {
  const ServicioEstadoMp({super.key, required this.nombre});

  final String nombre;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Estado de Habitación Hotel',
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
          title: const Text('Control de Estado de Habitaciones'),
          backgroundColor: const Color(0xFF1A1A1A),
        ),
        body: const Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: ServicioEstadoMp(
              nombre: 'Suite Deluxe #302',
            ),
          ),
        ),
      ),
    );
  }
}