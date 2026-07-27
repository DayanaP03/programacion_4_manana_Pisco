import 'package:flutter/material.dart';

class AvatarBadgeMp extends StatelessWidget {
  final String nombre;
  final int    alertas;
  final bool   activo;

  const AvatarBadgeMp({
    super.key,
    required this.nombre,
    required this.alertas,
    required this.activo,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,   // permite que el badge salga del Stack
      children: [
        // Avatar — capa inferior
        Container(
          width:  56,
          height: 56,
          decoration: BoxDecoration(
            color:        activo ? const Color(0xFFFF007F).withOpacity(0.2) : const Color(0xFF2A2A2A),
            borderRadius: BorderRadius.circular(12),
            border:       Border.all(color: activo ? const Color(0xFFFF007F) : Colors.grey.shade700),
          ),
          child: Center(
            child: Text(
              nombre.isNotEmpty ? nombre.substring(0, 2).toUpperCase() : 'HT',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize:   18,
                color:      activo ? const Color(0xFFFF007F) : Colors.grey,
              ),
            ),
          ),
        ),

        // Punto de estado — esquina inferior derecha
        Positioned(
          bottom: 0, right: 0,
          child: Container(
            width:  14,
            height: 14,
            decoration: BoxDecoration(
              color:  activo ? const Color(0xFF03DAC6) : const Color(0xFFCF6679),
              shape:  BoxShape.circle,
              border: Border.all(color: const Color(0xFF121212), width: 2),
            ),
          ),
        ),

        // Badge de alertas — capa superior, solo si las hay
        if (alertas > 0)
          Positioned(
            top: -4, right: -4,
            child: Container(
              padding:     const EdgeInsets.all(4),
              decoration:  const BoxDecoration(color: Colors.amber, shape: BoxShape.circle),
              constraints: const BoxConstraints(minWidth: 18, minHeight: 18),
              child: Text(
                alertas > 9 ? '9+' : '$alertas',
                style: const TextStyle(
                    color: Colors.black, fontSize: 10, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }
}