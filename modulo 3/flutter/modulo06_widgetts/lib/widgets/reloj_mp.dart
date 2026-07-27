import 'dart:async';
import 'package:flutter/material.dart';

class RelojMp extends StatefulWidget {
  const RelojMp({super.key});

  @override
  State<RelojMp> createState() => _RelojMpState();
}

class _RelojMpState extends State<RelojMp> {
  late Timer _timer;       
  int  _segundos = 0;
  bool _pausado  = false;

  @override
  void initState() {
    super.initState();    
    _iniciarTimer();
  }

  void _iniciarTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted) return;   
      setState(() => _segundos++);
    });
  }

  void _togglePausa() {
    setState(() {
      _pausado = !_pausado;
      if (_pausado) {
        _timer.cancel();      
      } else {
        _iniciarTimer();      
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();          
    super.dispose();          
  }

  String get _formato {
    final h = _segundos ~/ 3600;
    final m = (_segundos % 3600) ~/ 60;
    final s = _segundos % 60;
    return '$h:${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }

  // Color cambia según el tiempo transcurrido de espera de pago
  Color get _colorTiempo {
    if (_segundos > 60) return const Color(0xFFCF6679); // Rojo alerta
    if (_segundos > 30) return Colors.amber;          // Advertencia
    return const Color(0xFF03DAC6);                   // Verde neón/turquesa
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF171717),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFF2A2A2A)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Tiempo límite para pago de reserva',
            style: TextStyle(fontSize: 13, color: Colors.white70),
          ),
          const SizedBox(height: 8),
          Text(
            _formato,
            style: TextStyle(
              fontSize:   36,
              fontFamily: 'monospace',
              fontWeight: FontWeight.bold,
              color:      _colorTiempo,        
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FilledButton.icon(
                onPressed: _togglePausa,
                style: FilledButton.styleFrom(
                  backgroundColor: const Color(0xFFFF007F),
                ),
                icon:  Icon(_pausado ? Icons.play_arrow : Icons.pause),
                label: Text(_pausado ? 'Reanudar' : 'Pausar'),
              ),
              const SizedBox(width: 8),
              TextButton(
                onPressed: () => setState(() {
                  _timer.cancel();
                  _segundos = 0;
                  _pausado  = false;
                  _iniciarTimer();
                }),
                child: const Text('Reiniciar', style: TextStyle(color: Color(0xFF03DAC6))),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            _pausado ? 'Temporizador pausado' : 'Esperando pago...',
            style: const TextStyle(fontSize: 12, color: Colors.white38),
          ),
        ],
      ),
    );
  }
}