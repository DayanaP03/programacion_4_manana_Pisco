import 'package:flutter/material.dart';
import 'pantalla_dashboard.dart';

class PantallaContextoHotelmp extends StatelessWidget {
  const PantallaContextoHotelmp({super.key});

  @override
  Widget build(BuildContext context) {
    // ── Tema ──────────────────────────────────────────────────────
    final tema    = Theme.of(context);
    final colores = tema.colorScheme;

    // ── Pantalla ──────────────────────────────────────────────────
    final tamanio   = MediaQuery.sizeOf(context);
    final esMovil   = tamanio.width < 600;
    final esRetrato = MediaQuery.orientationOf(context) == Orientation.portrait;

    return Scaffold(
      backgroundColor: colores.surface,
      appBar: AppBar(
        backgroundColor: colores.primaryContainer,
        foregroundColor: colores.onPrimaryContainer,
        title: Text(
          'Hotel · ${esMovil ? "Móvil" : "Tablet"} (${esRetrato ? "Retrato" : "Paisaje"})',
          style: tema.textTheme.titleMedium?.copyWith(color: '#ffffff'.toColor()),
        ),
        actions: [
          IconButton(
            tooltip: 'Abrir dashboard',
            icon: const Icon(Icons.dashboard_customize_outlined),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const PantallaDashboard(),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ── Información de la Reserva / Pantalla ────────────────
          const _Seccion(
            titulo: 'Detalles del Dispositivo y Vista',
            items: [
              'Ancho de pantalla:    ',
              'Alto de pantalla:     ',
              'Pixel ratio:          ',
              'Orientación actual:   ',
            ],
          ),
          // Valores dinámicos simplificados para hoteles
          _SeccionDinamica(items: [
            'Ancho: ${tamanio.width.toStringAsFixed(0)} px',
            'Alto: ${tamanio.height.toStringAsFixed(0)} px',
            'Ratio: ${MediaQuery.devicePixelRatioOf(context).toStringAsFixed(1)}',
            'Modo: ${MediaQuery.orientationOf(context).name}',
          ]),
          const SizedBox(height: 16),

          // ── Paleta de Colores de la App de Hoteles ──────────────
          const _SeccionTitulo(titulo: 'Esquema de Colores (Hotel Theme)'),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8, runSpacing: 8,
            children: const [
              _ChipColor(nombre: 'primary (Neón)', color: Color(0xFFFF007F)),
              _ChipColor(nombre: 'surface (Dark)', color: Color(0xFF121212)),
              _ChipColor(nombre: 'cardBackground', color: Color(0xFF1A1A1A)),
              _ChipColor(nombre: 'error / alert', color: Color(0xFFCF6679)),
            ],
          ),
          const SizedBox(height: 24),

          // ── Tipografía enfocada a Hoteles ──────────────────────
          const _SeccionTitulo(titulo: 'Tipografía de Habitaciones y Tarifas'),
          const SizedBox(height: 8),
          Text('Grand Luxury Suite', style: tema.textTheme.displaySmall?.copyWith(color: Colors.white)),
          Text('USD $280.00 / noche', style: tema.textTheme.headlineMedium?.copyWith(color: const Color(0xFFFF007F))),
          Text('Incluye desayuno buffet y acceso al spa', style: tema.textTheme.titleLarge?.copyWith(color: Colors.white70)),
          Text('Check-in: 15:00 hrs · Check-out: 12:00 hrs', style: tema.textTheme.bodyLarge?.copyWith(color: Colors.white60)),
          Text('Cancelación gratuita hasta 48 horas antes.', style: tema.textTheme.bodyMedium?.copyWith(color: Colors.grey)),
          Text('ID de reserva: #HT-98421', style: tema.textTheme.labelSmall?.copyWith(color: const Color(0xFFFF007F))),
        ],
      ),
    );
  }
}

// Extension auxiliar rápida para colores hexadecimales si se requiere
extension StringColor on String {
  Color toColor() => Color(int.parse(this.replaceAll('#', '0xFF')));
}

// ── Widgets auxiliares privados ────────────────────────────────────

class _Seccion extends StatelessWidget {
  final String titulo;
  final List<String> items;
  const _Seccion({required this.titulo, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(titulo,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: const Color(0xFFFF007F), fontWeight: FontWeight.bold)),
        const Divider(color: Color(0xFF2a2a2a)),
        for (final item in items)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Text(item, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white70)),
          ),
      ],
    );
  }
}

class _SeccionDinamica extends StatelessWidget {
  final List<String> items;
  const _SeccionDinamica({required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final item in items)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Text(item, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white, fontFamily: 'monospace')),
          ),
      ],
    );
  }
}

class _SeccionTitulo extends StatelessWidget {
  final String titulo;
  const _SeccionTitulo({required this.titulo});

  @override
  Widget build(BuildContext context) {
    return Text(titulo,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: const Color(0xFFFF007F), fontWeight: FontWeight.bold));
  }
}

class _ChipColor extends StatelessWidget {
  final String nombre;
  final Color color;
  const _ChipColor({required this.nombre, required this.color});

  @override
  Widget build(BuildContext context) {
    final luminancia = color.computeLuminance();
    final textoColor = luminancia > 0.4 ? Colors.black87 : Colors.white;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
      child: Text(nombre, style: TextStyle(color: textoColor, fontSize: 11, fontWeight: FontWeight.w600)),
    );
  }
}