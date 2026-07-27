import 'package:flutter/material.dart';

class FilaEstadoMp extends StatelessWidget {
  final String nombre;
  final String detalle;
  final bool   activo;

  const FilaEstadoMp({
    super.key,
    required this.nombre,
    required this.detalle,
    required this.activo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFF171717),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFF2A2A2A)),
      ),
      child: Row(
        children: [
          // Ícono de estado del hotel
          Icon(
            activo ? Icons.check_circle : Icons.cancel,
            color: activo ? const Color(0xFF03DAC6) : const Color(0xFFCF6679),
            size:  20,
          ),
          const SizedBox(width: 12),

          // Expanded — el Column ocupa todo el espacio restante
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize:       MainAxisSize.min,
              children: [
                Text(nombre,
                    style:    const TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
                    overflow: TextOverflow.ellipsis),
                Text(detalle,
                    style: const TextStyle(fontSize: 12, color: Colors.white60)),
              ],
            ),
          ),

          const SizedBox(width: 8),

          // Chip de estado — queda pegado al borde derecho gracias a Expanded
          Container(
            padding:    const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color:        (activo ? const Color(0xFF03DAC6) : const Color(0xFFCF6679)).withOpacity(0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              activo ? 'Disponible' : 'Ocupada',
              style: TextStyle(
                fontSize:   11,
                color:      activo ? const Color(0xFF03DAC6) : const Color(0xFFCF6679),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}