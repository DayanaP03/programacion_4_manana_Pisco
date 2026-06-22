// lib/widgets/cronometro_sesion.dart
import 'dart:async';
import 'package:flutter/material.dart';

class CronometroSesion extends StatefulWidget {
  const CronometroSesion({super.key});

  @override
  State<CronometroSesion> createState() => _CronometroSesionState();
}

class _CronometroSesionState extends State<CronometroSesion> {
  int _segundos = 0;
  Timer? _timer;
  final List<String> _vueltas = [];

  void _iniciarDetener() {
    if (_timer != null) {
      _timer!.cancel();
      _timer = null;
      setState(() {});
    } else {
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          _segundos++;
        });
      });
    }
  }

  void _registrarVuelta() {
    if (_timer != null) {
      setState(() {
        _vueltas.insert(0, _formatearTiempo(_segundos));
      });
    }
  }

  String _formatearTiempo(int totalSegundos) {
    final minutos = (totalSegundos ~/ 60).toString().padLeft(2, '0');
    final segundos = (totalSegundos % 60).toString().padLeft(2, '0');
    return "$minutos:$segundos";
  }

  Color _obtenerColorPorRango() {
    if (_segundos < 15) return Colors.green;
    if (_segundos < 30) return Colors.orange;
    return Colors.red;
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          _formatearTiempo(_segundos),
          style: TextStyle(
            fontSize: 60, 
            fontWeight: FontWeight.bold, 
            color: _obtenerColorPorRango()
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: _iniciarDetener,
              icon: Icon(_timer != null ? Icons.pause : Icons.play_arrow),
              label: Text(_timer != null ? 'Pausar' : 'Iniciar'),
            ),
            const SizedBox(width: 15),
            ElevatedButton.icon(
              onPressed: _timer != null ? _registrarVuelta : null,
              icon: const Icon(Icons.flag),
              label: const Text('Vuelta'),
            ),
          ],
        ),
        const SizedBox(height: 20),
        const Text('Historial de Vueltas:', style: TextStyle(fontWeight: FontWeight.bold)),
        Expanded(
          child: ListView.builder(
            itemCount: _vueltas.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(Icons.timer, color: Colors.indigo.shade300),
                title: Text('Vuelta ${_vueltas.length - index}: ${_vueltas[index]}'),
              );
            },
          ),
        )
      ],
    );
  }
}