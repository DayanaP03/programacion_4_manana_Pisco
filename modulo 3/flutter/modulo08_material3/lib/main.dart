import 'package:flutter/material.dart';
import 'widgets/catalogo_botones_mp.dart'; // Importa el widget creado arriba

void main() {
  runApp(const HotelBotonesApp());
}

class HotelBotonesApp extends StatelessWidget {
  const HotelBotonesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Botones Hotel App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0E0E0E),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFFF007F),
          primaryContainer: Color(0xFF1A1A1A),
          secondary: Color(0xFF03DAC6),
          surface: Color(0xFF121212),
          surfaceContainerHighest: Color(0xFF1F1F1F),
          error: Color(0xFFCF6679),
        ),
        useMaterial3: true,
      ),
      home: const CatalogoBotonesMp(),
    );
  }
}