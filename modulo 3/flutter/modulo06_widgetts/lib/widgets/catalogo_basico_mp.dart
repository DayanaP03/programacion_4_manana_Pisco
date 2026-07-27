import 'package:flutter/material.dart';

class CatalogoHotelmp extends StatelessWidget {
  const CatalogoHotelmp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Componentes de Reserva de Hotel')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          // ── Bloque 1: Text ────────────────────────────────────────────
          const Text(
            'Suite Presidencial: Disponible',
            style: TextStyle(
              fontSize:     20,
              fontWeight:   FontWeight.bold,
              color:        Color(0xFF03DAC6),
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: Text(
              'Habitación Deluxe 402 - Vista al mar y terraza privada con jacuzzi',
              textAlign: TextAlign.center,
              maxLines:  1,
              overflow:  TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 8),
          const Text.rich(
            TextSpan(children: [
              TextSpan(text: 'Tarifa: ',
                  style: TextStyle(fontWeight: FontWeight.w600)),
              TextSpan(text: '\$280 / noche',
                  style: TextStyle(color: Color(0xFFFF007F), fontWeight: FontWeight.bold)),
              TextSpan(text: ' — incluye desayuno buffet',
                  style: TextStyle(color: Colors.grey, fontSize: 12)),
            ]),
          ),
          const SizedBox(height: 8),
          const SelectableText('ID-RESERVACION-98421',
              style: TextStyle(fontFamily: 'monospace', fontSize: 14)),
          const Divider(height: 32),

          // ── Bloque 2: Icon ────────────────────────────────────────────
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Icon(Icons.hotel,           size: 40, color: Color(0xFFFF007F)),
              Icon(Icons.spa,             size: 40, color: Color(0xFF03DAC6)),
              Icon(Icons.pool,            size: 40, color: Colors.blueAccent),
              Icon(Icons.room_service,    size: 40, color: Colors.amber),
              Icon(Icons.no_meeting_room, size: 40, color: Colors.grey),
            ],
          ),
          const SizedBox(height: 8),
          const Icon(Icons.room_preferences, size: 24, color: Colors.blueGrey,
              semanticLabel: 'Preferencias de habitación'),
          const Divider(height: 32),

          // ── Bloque 3: Botones ─────────────────────────────────────────
          Wrap(
            spacing: 8, runSpacing: 8,
            children: [
              ElevatedButton(onPressed: () {}, child: const Text('Reservar')),
              FilledButton(  onPressed: () {}, child: const Text('Confirmar')),
              OutlinedButton(onPressed: () {}, child: const Text('Modificar')),
              TextButton(    onPressed: () {}, child: const Text('Detalles')),
              ElevatedButton(onPressed: null,  child: const Text('No disponible')),
            ],
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8, runSpacing: 8,
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                icon:  const Icon(Icons.refresh, size: 18),
                label: const Text('Actualizar Fechas'),
              ),
              FilledButton.icon(
                onPressed: () {},
                icon:  const Icon(Icons.cancel, size: 18),
                label: const Text('Cancelar Reserva'),
              ),
              IconButton(
                onPressed: () {},
                icon:     const Icon(Icons.tune),
                color:    const Color(0xFFFF007F),
                iconSize: 28,
              ),
            ],
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFF007F),
              foregroundColor: Colors.white,
              padding:     const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              elevation:   4,
              minimumSize: const Size(double.infinity, 0),
            ),
            child: const Text('Realizar pago de reserva',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          const Divider(height: 32),

          // ── Bloque 4: Card y ListTile ─────────────────────────────────
          Card(
            elevation: 3,
            margin: const EdgeInsets.only(bottom: 8),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading:  const Icon(Icons.king_bed, color: Color(0xFFFF007F)),
              title:    const Text('Suite Deluxe #302'),
              subtitle: const Text('María González · 3 noches'),
              trailing: const Icon(Icons.circle, color: Color(0xFF03DAC6), size: 12),
              onTap:    () {},
            ),
          ),
          Card(
            elevation: 1,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: const Color(0xFFFF007F).withOpacity(0.2),
                child: const Icon(Icons.cancel_outlined, color: Color(0xFFFF007F), size: 20),
              ),
              title:    const Text('Habitación Estándar #104'),
              subtitle: const Text('Carlos Vega · Cancelada'),
              trailing: TextButton(
                  onPressed: () {}, child: const Text('Revisar')),
            ),
          ),
          const Divider(height: 32),

          // ── Bloque 5: Chip ────────────────────────────────────────────
          Wrap(
            spacing: 8, runSpacing: 8,
            children: [
              const Chip(label: Text('Todo Incluido')),
              const Chip(
                avatar:          Icon(Icons.check, size: 16, color: Colors.white),
                label:           Text('Desayuno Gratis'),
                backgroundColor: Color(0xFF03DAC6),
                labelStyle: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),
              ),
              FilterChip(
                label: const Text('Vista al mar'),
                selected: true, onSelected: (_) {},
              ),
              ActionChip(
                label:     const Text('Ver servicios'),
                avatar:    const Icon(Icons.room_service, size: 16),
                onPressed: () {},
              ),
            ],
          ),
          const Divider(height: 32),

          // ── Bloque 6: Indicadores de progreso ────────────────────────
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              SizedBox(width: 48, height: 48,
                  child: CircularProgressIndicator(color: Color(0xFFFF007F))),
              SizedBox(width: 48, height: 48,
                  child: CircularProgressIndicator(
                    value: 0.85, color: Color(0xFF03DAC6), strokeWidth: 6)),
              SizedBox(width: 48, height: 48,
                  child: CircularProgressIndicator(
                    value: 0.4, color: Colors.amber,
                    strokeWidth: 3, strokeCap: StrokeCap.round)),
            ],
          ),
          const SizedBox(height: 16),
          const LinearProgressIndicator(color: Color(0xFFFF007F)),
          const SizedBox(height: 8),
          const LinearProgressIndicator(value: 0.75, color: Color(0xFF03DAC6)),
          const SizedBox(height: 8),
          const LinearProgressIndicator(
              value: 1.0, color: Colors.amber, minHeight: 6),
        ],
      ),
    );
  }
}