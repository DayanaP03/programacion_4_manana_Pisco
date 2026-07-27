import 'package:flutter/material.dart';
import '../models/servidor_ssh_mp.dart';

class TarjetaReservaHotelGridMp extends StatelessWidget {
  final HabitacionHotel habitacion;
  final VoidCallback onFavorito;
  final VoidCallback onEliminar;

  const TarjetaReservaHotelGridMp({
    super.key,
    required this.habitacion,
    required this.onFavorito,
    required this.onEliminar,
  });

  @override
  Widget build(BuildContext context) {
    const accent = Color(0xFFFF007F);
    const ok = Color(0xFF03DAC6);

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF171717),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFF2A2A2A)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  habitacion.nombre,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ),
              IconButton(
                onPressed: onFavorito,
                icon: Icon(
                  habitacion.favorito ? Icons.favorite : Icons.favorite_border,
                  color: habitacion.favorito ? accent : Colors.grey,
                  size: 20,
                ),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            '${habitacion.ubicacion} - Piso ${habitacion.piso}',
            style: const TextStyle(color: Colors.white70, fontSize: 12),
          ),
          const SizedBox(height: 4),
          Text(
            habitacion.tipoBed,
            style: const TextStyle(color: ok, fontSize: 12),
          ),
          const Spacer(),
          Row(
            children: [
              Icon(
                habitacion.wifiGratis ? Icons.wifi : Icons.wifi_off,
                size: 15,
                color: habitacion.wifiGratis ? ok : Colors.white54,
              ),
              const SizedBox(width: 6),
              Text(
                habitacion.wifiGratis ? 'WiFi gratis' : 'Sin WiFi',
                style: const TextStyle(color: Colors.white60, fontSize: 11),
              ),
              const Spacer(),
              IconButton(
                onPressed: onEliminar,
                icon: const Icon(Icons.delete_outline, color: Color(0xFFCF6679), size: 18),
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