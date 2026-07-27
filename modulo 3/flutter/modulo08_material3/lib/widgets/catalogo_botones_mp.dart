import 'package:flutter/material.dart';

class CatalogoBotonesMp extends StatelessWidget {
  const CatalogoBotonesMp({super.key});

  @override
  Widget build(BuildContext context) {
    final cs   = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title:         const Text('Acciones de Reserva'),
        backgroundColor: cs.surfaceContainerHighest,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          // ── Los 5 variantes ──────────────────────────────────────
          Text('Variantes — de mayor a menor énfasis',
              style: text.labelLarge?.copyWith(color: cs.primary)),
          const SizedBox(height: 12),
          FilledButton(
            onPressed: () {},
            child: const Text('FilledButton — Confirmar reserva'),
          ),
          const SizedBox(height: 8),
          FilledButton.tonal(
            onPressed: () {},
            child: const Text('FilledButton.tonal — Añadir desayuno'),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {},
            child: const Text('ElevatedButton — Ver detalles de suite'),
          ),
          const SizedBox(height: 8),
          OutlinedButton(
            onPressed: () {},
            child: const Text('OutlinedButton — Modificar fechas'),
          ),
          const SizedBox(height: 8),
          TextButton(
            onPressed: () {},
            child: const Text('TextButton — Ver términos y condiciones'),
          ),

          const Divider(height: 32),

          // ── Con ícono ────────────────────────────────────────────
          Text('Con ícono',
              style: text.labelLarge?.copyWith(color: cs.primary)),
          const SizedBox(height: 12),
          FilledButton.icon(
            onPressed: () {},
            icon:  const Icon(Icons.bookmark),
            label: const Text('Realizar Check-in'),
          ),
          const SizedBox(height: 8),
          OutlinedButton.icon(
            onPressed: () {},
            icon:  const Icon(Icons.receipt_long),
            label: const Text('Descargar factura'),
          ),
          const SizedBox(height: 8),
          TextButton.icon(
            onPressed: () {},
            icon:  const Icon(Icons.support_agent),
            label: const Text('Contactar recepción'),
          ),

          const Divider(height: 32),

          // ── Estados y personalización ────────────────────────────
          Text('Estados y personalización',
              style: text.labelLarge?.copyWith(color: cs.primary)),
          const SizedBox(height: 12),
          FilledButton(
            onPressed: null,               // null = deshabilitado
            child: const Text('Habitación no disponible'),
          ),
          const SizedBox(height: 8),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: cs.error,
              foregroundColor: cs.onError,
              minimumSize:     const Size(double.infinity, 48),
            ),
            onPressed: () {},
            child: const Text('Cancelar reserva'),
          ),
          const SizedBox(height: 8),
          // Fila de botones compactos
          Row(children: [
            Expanded(
              child: OutlinedButton(onPressed: () {}, child: const Text('Modificar')),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: FilledButton(onPressed: () {}, child: const Text('Pagar ahora')),
            ),
          ]),
        ],
      ),
    );
  }
}