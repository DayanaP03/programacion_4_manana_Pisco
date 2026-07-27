import 'package:flutter/material.dart';

class ServicioEstadoMp extends StatefulWidget {
  final String nombre;
  const ServicioEstadoMp({super.key, required this.nombre});

  @override
  State<ServicioEstadoMp> createState() => _ServicioEstadoMpState();
}

class _ServicioEstadoMpState extends State<ServicioEstadoMp> {
  bool _activo    = true;
  int  _reinicios = 0;

  static const int _maxReinicios = 3;

  void _toggle() {
    setState(() {             // notifica a Flutter → rebuild
      _activo = !_activo;
      if (_activo) _reinicios++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final enLimite = _reinicios >= _maxReinicios;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF171717),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF2A2A2A)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [

          // ── Patrón 1: Ícono + color condicional ─────────────────
          Icon(
            _activo ? Icons.check_circle : Icons.cancel,
            size:  72,
            color: _activo ? const Color(0xFF03DAC6) : const Color(0xFFCF6679),
          ),
          const SizedBox(height: 8),

          Text(widget.nombre,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white)),

          // ── Patrón 2: Texto condicional ──────────────────────────
          Text(
            _activo ? 'Disponible' : 'Fuera de servicio / Limpieza',
            style: TextStyle(
              fontSize:   15,
              fontWeight: FontWeight.w600,
              color:      _activo ? const Color(0xFF03DAC6) : const Color(0xFFCF6679),
            ),
          ),
          const SizedBox(height: 16),

          // ── Patrón 3: Widget que aparece / desaparece ────────────
          if (!_activo)
            Container(
              margin:     const EdgeInsets.only(bottom: 16),
              padding:    const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color:        const Color(0xFFCF6679).withOpacity(0.15),
                borderRadius: BorderRadius.circular(8),
                border:       Border.all(color: const Color(0xFFCF6679).withOpacity(0.5)),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.warning_amber, color: Color(0xFFCF6679), size: 16),
                  SizedBox(width: 6),
                  Text('Requiere mantenimiento',
                      style: TextStyle(color: Color(0xFFCF6679), fontSize: 13)),
                ],
              ),
            ),

          // ── Patrón 4: Botón con texto, color y estado dinámicos ──
          FilledButton.icon(
            onPressed: enLimite ? null : _toggle,    // null = desactivado
            icon: Icon(_activo ? Icons.block : Icons.check),
            label: Text(_activo ? 'Bloquear para limpieza' : 'Habilitar habitación'),
            style: FilledButton.styleFrom(
              backgroundColor: _activo ? const Color(0xFFCF6679) : const Color(0xFFFF007F),
              foregroundColor: Colors.white,
            ),
          ),
          const SizedBox(height: 12),

          // ── Patrón 5: Opacidad condicional ───────────────────────
          Opacity(
            opacity: enLimite ? 0.4 : 1.0,
            child: Text(
              'Reportes de mantenimiento: $_reinicios / $_maxReinicios',
              style: TextStyle(
                fontSize: 13,
                color:    enLimite ? const Color(0xFFCF6679) : Colors.white60,
              ),
            ),
          ),

          // ── Patrón 6: Widget condicional por otro estado ─────────
          if (enLimite)
            const Padding(
              padding: EdgeInsets.only(top: 8),
              child: Text(
                'Límite de reportes de mantenimiento alcanzado',
                style: TextStyle(
                    fontSize: 12, color: Color(0xFFCF6679), fontWeight: FontWeight.bold),
              ),
            ),
        ],
      ),
    );
  }
}