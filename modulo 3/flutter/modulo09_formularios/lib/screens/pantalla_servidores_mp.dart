import 'package:flutter/material.dart';
import '../models/servidor_ssh_mp.dart';

class TarjetaHabitacionGrid extends StatelessWidget {
  final HabitacionHotel habitacion;
  final VoidCallback onFavorito;
  final VoidCallback onEliminar;

  const TarjetaHabitacionGrid({
    super.key,
    required this.habitacion,
    required this.onFavorito,
    required this.onEliminar,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF171717),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF2A2A2A)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                habitacion.nombre,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                overflow: TextOverflow.ellipsis,
              ),
              IconButton(
                icon: Icon(
                  habitacion.favorito ? Icons.favorite : Icons.favorite_border,
                  color: habitacion.favorito ? const Color(0xFFFF007F) : Colors.grey,
                  size: 20,
                ),
                onPressed: onFavorito,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ],
          ),
          Text(
            '${habitacion.ubicacion} (Piso ${habitacion.piso})',
            style: const TextStyle(color: Colors.white60, fontSize: 12),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                habitacion.tipoBed,
                style: const TextStyle(color: Color(0xFF03DAC6), fontSize: 12, fontWeight: FontWeight.w600),
              ),
              IconButton(
                icon: const Icon(Icons.delete_outline, color: Color(0xFFCF6679), size: 18),
                onPressed: onEliminar,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}