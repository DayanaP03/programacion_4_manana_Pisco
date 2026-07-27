import 'package:flutter/material.dart';

class CustomizedSizedBoxMp extends StatelessWidget {
  final String nombre;
  final String detalle;
  final bool   activo;

  const CustomizedSizedBoxMp({
    super.key,
    required this.nombre,
    required this.detalle,
    required this.activo,
  });                           

  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // SizedBox — espaciado fijo
          const Text('SizedBox (Espaciado Fijo)', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF03DAC6))),
          const SizedBox(height: 8),
          const Text('Habitación estándar seleccionada'),
          const SizedBox(height: 32),          // ← espacio fijo de 32px
          const Text('Suites disponibles (después de 32px)'),

          const Divider(height: 32),

          // Padding — espacio alrededor de un hijo
          const Text('Padding (Sangría)', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF03DAC6))),
          const SizedBox(height: 8),
          Container(
            color: const Color(0xFF1A1A1A),
            child: const Padding(
              padding: EdgeInsets.only(left: 24),    // ← sangría izquierda
              child:   Text('Condiciones especiales de reserva con sangría'),
            ),
          ),

          const Divider(height: 32),

          // Align — posicionar dentro del espacio disponible
          const Text('Align (Alineación)', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF03DAC6))),
          const SizedBox(height: 8),
          const Align(
            alignment: Alignment.centerRight,        // ← borde derecho
            child: Icon(Icons.room_service, color: Color(0xFFFF007F)),
          ),

          const Divider(height: 32),

          // Wrap — flujo automático de elementos
          const Text('Wrap (Servicios del Hotel)', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF03DAC6))),
          const SizedBox(height: 8),
          Wrap(
            spacing:    8,
            runSpacing: 8,
            children: ['Spa', 'Wi-Fi Gratis', 'Piscina', 'Desayuno', 'Parking', 'Gimnasio', 'Pet Friendly']
                .map((t) => Chip(
                      label: Text(t),
                      backgroundColor: const Color(0xFF1A1A1A),
                      labelStyle: const TextStyle(color: Colors.white70),
                    ))
                .toList(),
          ),
        ],
      );
  }
}