// lib/main.dart
import 'package:flutter/material.dart';
import 'package:modulo06_widgetts/widgets/catalogo_basico.dart';
import 'widgets/etiqueta.dart';
import 'widgets/servicio_estado.dart';
import 'widgets/contador_limitado.dart';
import 'widgets/reloj.dart';
import 'screens/pantalla_contexto.dart';
import 'widgets/indicador.dart';

import 'dart:async'; // Necesario para el Timer del Cronómetro

// Imports de tus pantallas previas
import 'models/servidor.dart';
import 'widgets/tarjeta_metrica.dart';
import 'widgets/tarjeta_servidor.dart';
import 'screens/pantalla_dashboard.dart';

// ┌──────────────────────────────────────────────────────────────────┐
// │  Cambia este número y guarda (Ctrl+S) para navegar entre pasos.  │
// │  ... Pasos del 1 al 8 (Anteriores)                               │
// │  11 Paso 7   Monitor de Infraestructura                          │ 
// │  12 Ejercicio 1: Semáforo Interactivo (Mismo archivo)            │ <-- ¡AQUÍ!
// │  13 Ejercicio 2: Cronómetro de Sesión (Mismo archivo)            │ <-- ¡AQUÍ!
// └──────────────────────────────────────────────────────────────────┘
const int paso = 12; // <-- CAMBIA A 12 O 13 PARA VER TUS DOS EJERCICIOS ELEGIDOS

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
    useMaterial3: true,
  ),
  home: switch (paso) {
    1 => const Scaffold(body: Center(child: Saludo())),
    2 => const CatalogoBasicos(),
    3 => const Scaffold(body: Center(child: Wrap(spacing: 12, children: [Etiqueta(texto: 'Activo', color: Colors.green)]))),
    4 => const Scaffold(body: Center(child: ServicioEstado(nombre: 'nginx-proxy'))),
    5 => Scaffold(body: Center(child: ContadorLimitado(etiqueta: 'Login', limite: 3, color: Colors.red))),
    6 => Scaffold(appBar: AppBar(title: const Text('Cronómetro')), body: const Center(child: Reloj())),
    7 => const PantallaContexto(),  
    8 => Scaffold(body: Center(child: Indicador(label: 'OK', valor: '8', color: Colors.green, icono: Icons.dns))), 
    11 => const PantallaDashboard(), 

    // --- AQUÍ QUEDAN CONFIGURADOS TUS DOS EJERCICIOS ---
    12 => const Scaffold(body: Center(child: EjercicioSemaforo())),
    13 => const Scaffold(body: Padding(padding: EdgeInsets.only(top: 40), child: EjercicioCronometro())),

    _ => Scaffold(body: Center(child: Text('Paso $paso: No configurado'))),
  },
));

// ==========================================
//  EJERCICIO 1: SEMÁFORO INTERACTIVO
// ==========================================
class EjercicioSemaforo extends StatefulWidget {
  const EjercicioSemaforo({super.key});

  @override
  State<EjercicioSemaforo> createState() => _EjercicioSemaforoState();
}

class _EjercicioSemaforoState extends State<EjercicioSemaforo> {
  int _luzActiva = 0; // 0: Rojo, 1: Amarillo, 2: Verde

  void _cambiarLuz() {
    setState(() {
      _luzActiva = (_luzActiva + 1) % 3;
    });
  }

  @override
  Widget build(BuildContext context) {
    final textos = ["STOP", "PRECAUCIÓN", "GO"];
    final colores = [Colors.red, Colors.amber, Colors.green];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(color: Colors.black87, borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              Opacity(opacity: _luzActiva == 0 ? 1.0 : 0.25, child: const CircleAvatar(backgroundColor: Colors.red, radius: 30)),
              const SizedBox(height: 15),
              Opacity(opacity: _luzActiva == 1 ? 1.0 : 0.25, child: const CircleAvatar(backgroundColor: Colors.amber, radius: 30)),
              const SizedBox(height: 15),
              Opacity(opacity: _luzActiva == 2 ? 1.0 : 0.25, child: const CircleAvatar(backgroundColor: Colors.green, radius: 30)),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Text(textos[_luzActiva], style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: colores[_luzActiva])),
        const SizedBox(height: 20),
        ElevatedButton(onPressed: _cambiarLuz, child: const Text('Avanzar Semáforo')),
      ],
    );
  }
}

// ==========================================
//  EJERCICIO 2: CRONÓMETRO DE SESIÓN
// ==========================================
class EjercicioCronometro extends StatefulWidget {
  const EjercicioCronometro({super.key});

  @override
  State<EjercicioCronometro> createState() => _EjercicioCronometroState();
}

class _EjercicioCronometroState extends State<EjercicioCronometro> {
  int _segundos = 0;
  Timer? _timer;
  final List<String> _vueltas = [];

  void _iniciarOpausar() {
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

  void _guardarVuelta() {
    if (_timer != null) {
      setState(() {
        _vueltas.insert(0, _formatearTiempo(_segundos));
      });
    }
  }

  String _formatearTiempo(int ticks) {
    final m = (ticks ~/ 60).toString().padLeft(2, '0');
    final s = (ticks % 60).toString().padLeft(2, '0');
    return "$m:$s";
  }

  Color _obtenerColorDinamico() {
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
        const Text('Cronómetro de Sesión', style: TextStyle(fontSize: 18, color: Colors.grey)),
        const SizedBox(height: 10),
        Text(
          _formatearTiempo(_segundos),
          style: TextStyle(fontSize: 65, fontWeight: FontWeight.bold, color: _obtenerColorDinamico()),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: _iniciarOpausar,
              icon: Icon(_timer != null ? Icons.pause : Icons.play_arrow),
              label: Text(_timer != null ? 'Pausar' : 'Iniciar'),
            ),
            const SizedBox(width: 15),
            ElevatedButton.icon(
              onPressed: _timer != null ? _guardarVuelta : null, // Deshabilitado si está en pausa
              icon: const Icon(Icons.flag),
              label: const Text('Vuelta'),
            ),
          ],
        ),
        const SizedBox(height: 30),
        const Text('Vueltas Registradas', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        const Divider(indent: 40, endIndent: 40),
        Expanded(
          child: _vueltas.isEmpty
              ? const Center(child: Text('No hay vueltas guardadas', style: TextStyle(color: Colors.grey)))
              : ListView.builder(
                  itemCount: _vueltas.length,
                  itemBuilder: (context, i) {
                    return ListTile(
                      dense: true,
                      leading: const Icon(Icons.timer_outlined, color: Colors.indigo),
                      title: Text('Vuelta ${_vueltas.length - i}'),
                      trailing: Text(_vueltas[i], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                    );
                  },
                ),
        ),
      ],
    );
  }
}

// El saludo original de tu código
class Saludo extends StatelessWidget {
  const Saludo({super.key});
  @override
  Widget build(BuildContext context) {   
    return const Center(child: Text('La Tri', style: TextStyle(fontSize: 32)));
  }
}