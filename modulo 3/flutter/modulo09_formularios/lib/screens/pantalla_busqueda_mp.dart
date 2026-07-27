import 'package:flutter/material.dart';
import '../models/servidor_ssh_mp.dart';

class FilaHabitacion extends StatelessWidget {
  final HabitacionHotel habitacion;
  final VoidCallback onFavorito;
  final VoidCallback onEliminar;

  const FilaHabitacion({
    super.key,
    required this.habitacion,
    required this.onFavorito,
    required this.onEliminar,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: const Color(0xFFFF007F).withValues(alpha: 0.2),
        child: Text(
          habitacion.nombre.substring(0, 2).toUpperCase(),
          style: const TextStyle(color: Color(0xFFFF007F), fontWeight: FontWeight.bold),
        ),
      ),
      title: Text(habitacion.nombre, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text('${habitacion.ubicacion} · Piso ${habitacion.piso} · ${habitacion.tipoBed}'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(
              habitacion.favorito ? Icons.favorite : Icons.favorite_border,
              color: habitacion.favorito ? const Color(0xFFFF007F) : Colors.grey,
            ),
            onPressed: onFavorito,
          ),
          IconButton(
            icon: const Icon(Icons.delete_outline, color: Color(0xFFCF6679)),
            onPressed: onEliminar,
          ),
        ],
      ),
    );
  }
}