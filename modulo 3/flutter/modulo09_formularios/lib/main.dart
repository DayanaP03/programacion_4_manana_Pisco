import 'package:flutter/material.dart';
import 'models/servidor_ssh_mp.dart';
import 'screens/pantalla_busqueda_mp.dart';
import 'widgets/tarjetaservidorgrid_mp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const PantallaBusquedaHotel(),
    );
  }
}

class PantallaBusquedaHotel extends StatefulWidget {
  const PantallaBusquedaHotel({super.key});

  @override
  State<PantallaBusquedaHotel> createState() => _PantallaBusquedaHotelState();
}

class _PantallaBusquedaHotelState extends State<PantallaBusquedaHotel> {
  final _habitaciones = [
    HabitacionHotel(id: '1', nombre: 'Suite Deluxe Mar', ubicacion: 'Torre Norte', piso: 4, tipoBed: 'King Size', wifiGratis: true, favorito: true),
    HabitacionHotel(id: '2', nombre: 'Doble Estándar', ubicacion: 'Torre Sur', piso: 2, tipoBed: 'Doble Queen', wifiGratis: true),
    HabitacionHotel(id: '3', nombre: 'Junior Suite', ubicacion: 'Ático', piso: 6, tipoBed: 'King Size', wifiGratis: false),
    HabitacionHotel(id: '4', nombre: 'Habitación Individual', ubicacion: 'Planta Baja', piso: 1, tipoBed: 'Individual', wifiGratis: false),
  ];

  String _busqueda = '';
  bool _modoGrid = true;

  List<HabitacionHotel> get _filtrados => _habitaciones
      .where((h) =>
          h.nombre.toLowerCase().contains(_busqueda.toLowerCase()) ||
          h.ubicacion.toLowerCase().contains(_busqueda.toLowerCase()) ||
          h.tipoBed.toLowerCase().contains(_busqueda.toLowerCase()))
      .toList();

  void _toggleFavorito(HabitacionHotel h) =>
      setState(() => h.favorito = !h.favorito);

  void _eliminar(HabitacionHotel h) =>
      setState(() => _habitaciones.removeWhere((x) => x.id == h.id));

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final filtrados = _filtrados;

    return Scaffold(
      appBar: AppBar(
        title: Text('Habitaciones (${_habitaciones.length})'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
        actions: [
          IconButton(
            icon: Icon(_modoGrid ? Icons.list : Icons.grid_view),
            onPressed: () => setState(() => _modoGrid = !_modoGrid),
            tooltip: _modoGrid ? 'Vista lista' : 'Vista cuadrícula',
          ),
        ],
      ),
      body: Column(
        children: [
          // ── SearchBar ─────────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: SearchBar(
              hintText: 'Buscar por nombre, ubicación o cama...',
              leading: const Icon(Icons.search),
              trailing: _busqueda.isNotEmpty
                  ? [
                      IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () => setState(() => _busqueda = ''),
                      ),
                    ]
                  : null,
              onChanged: (v) => setState(() => _busqueda = v),
              padding: const WidgetStatePropertyAll(
                EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
          ),

          // ── Contador de resultados ────────────────────────────────
          if (_busqueda.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 4),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '${filtrados.length} resultado${filtrados.length == 1 ? '' : 's'}',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: cs.onSurfaceVariant,
                      ),
                ),
              ),
            ),

          // ── Lista o Grid ──────────────────────────────────────────
          Expanded(
            child: filtrados.isEmpty
                ? Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.search_off, size: 56, color: cs.onSurfaceVariant),
                        const SizedBox(height: 12),
                        Text(
                          'Sin resultados para "$_busqueda"',
                          style: TextStyle(color: cs.onSurfaceVariant),
                        ),
                        const SizedBox(height: 8),
                        TextButton(
                          onPressed: () => setState(() => _busqueda = ''),
                          child: const Text('Limpiar búsqueda'),
                        ),
                      ],
                    ),
                  )
                : _modoGrid
                    ? GridView.builder(
                        padding: const EdgeInsets.all(12),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.1,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                        ),
                        itemCount: filtrados.length,
                        itemBuilder: (ctx, i) => TarjetaReservaHotelGridMp(
                          habitacion: filtrados[i],
                          onFavorito: () => _toggleFavorito(filtrados[i]),
                          onEliminar: () => _eliminar(filtrados[i]),
                        ),
                      )
                    : ListView.separated(
                        itemCount: filtrados.length,
                        separatorBuilder: (_, __) =>
                            const Divider(height: 1, indent: 72),
                        itemBuilder: (ctx, i) => FilaHabitacion(
                          habitacion: filtrados[i],
                          onFavorito: () => _toggleFavorito(filtrados[i]),
                          onEliminar: () => _eliminar(filtrados[i]),
                        ),
                      ),
          ),
        ],
      ),
    );
  }
}