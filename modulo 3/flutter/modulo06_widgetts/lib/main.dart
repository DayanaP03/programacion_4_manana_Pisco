// lib/main.dart
import 'package:flutter/material.dart';
import 'package:modulo06_widgetts/widgets/catalogo_basico.dart';
import 'widgets/etiqueta.dart';
import 'widgets/servicio_estado.dart';
import 'widgets/contador_limitado.dart';
import 'widgets/reloj.dart';
import 'screens/pantalla_contexto.dart';
import 'widgets/indicador.dart';

// 1. Tus nuevos imports
import 'models/servidor.dart';
import 'widgets/tarjeta_metrica.dart';
import 'widgets/tarjeta_servidor.dart';
import 'screens/pantalla_dashboard.dart';

// ┌──────────────────────────────────────────────────────────────────┐
// │  Cambia este número y guarda (Ctrl+S) para navegar entre pasos.  │
// │  1  Paso 1   StatelessWidget mínimo                              │
// │  2  Paso 1b  Widgets básicos — catálogo                          │
// │  3  Paso 2   StatelessWidget con parámetros                      │
// │  4  Paso 3   StatefulWidget / setState / cambio de estatus       │
// │  5  Paso 3b  Parámetros en StatefulWidget                         │
// │  6  Paso 4   Ciclo de vida con Timer                             │
// │  7  Paso 5   BuildContext                                        │
// │  8  Paso 6   Composición de widgets                              │
// │  9  Paso 7a  Ver solo Tarjeta Métrica (Individual)               │ <-- ¡NUEVO!
// │  10 Paso 7b  Ver solo Tarjeta Servidor (Individual)              │ <-- ¡NUEVO!
// │  11 Paso 7c  Monitor de Infraestructura (Pantalla Completa)      │ <-- ¡NUEVO!
// └──────────────────────────────────────────────────────────────────┘
const int paso = 9; // <-- CAMBIA AQUÍ (9, 10 o 11) PARA VER LOS NUEVOS WIDGETS

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    colorScheme:  ColorScheme.fromSeed(
      seedColor:  Colors.indigo,
      brightness: Brightness.light,    
    ),
    useMaterial3: true,
  ),
  home: switch (paso) {
    1 => const Scaffold(body: Center(child: Saludo())),
    2 => const CatalogoBasicos(),
    3 => const Scaffold(
      body: Center(
        child: Wrap(
          spacing:    12,
          runSpacing: 8,
          children: [
            Etiqueta(texto: 'Activo',    color: Colors.green),
            Etiqueta(texto: 'Error',     color: Colors.red,    relleno: true),
            Etiqueta(texto: 'En espera', color: Colors.orange),
            Etiqueta(texto: 'Crítico',   color: Colors.red,    fontSize: 16, relleno: true),
            Etiqueta(texto: 'Info',      color: Colors.blue,   fontSize: 11),
          ],
        ),
      ),
    ),
    4 => const Scaffold(
      body: Center(
        child: ServicioEstado(nombre: 'nginx-proxy'),
      ),
    ),
    5 => Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ContadorLimitado(
              etiqueta: 'Intentos de login',
              limite:   3,
              color:    Colors.red,
              onLimite: () => debugPrint('¡Cuenta bloqueada!'),
            ),
            const SizedBox(height: 40),
            ContadorLimitado(
              etiqueta: 'Conexiones activas',
              limite:   10,
              color:    Colors.indigo,
            ),
          ],
        ),
      ),
    ),
    6 => Scaffold(
      appBar: AppBar(title: const Text('Cronómetro')),
      body: const Center(child: Reloj()),
    ),
    7 => const PantallaContexto(),  
    8 => Scaffold(
      body: Center(
        child: Wrap(
          spacing:    32,
          runSpacing: 24,
          alignment:  WrapAlignment.center,
          children: const [
            Indicador(label: 'Servidores activos', valor: '8', color: Colors.green, icono: Icons.dns),
            Indicador(label: 'Alertas críticas',   valor: '2', color: Colors.red,    icono: Icons.warning_amber, subtitulo: 'Requieren atención'),
            Indicador(label: 'Tráfico',            valor: '4.2 GB', color: Colors.indigo),
            Indicador(label: 'Uptime',             valor: '99.8%', color: Colors.teal, subtitulo: 'Últimos 30 días'),
          ],
        ),
      ),
    ), 
    
    // --- NUEVOS PASOS INDIVIDUALES PARA TU MONITOREO ---
    
    // PASO 9: Muestra solo la Tarjeta Métrica individualmente
    9 => const Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: TarjetaMetrica(
            titulo: 'Memoria RAM Total', 
            valor: '16 GB', 
            icono: Icons.memory, 
            colorIcono: Colors.purple,
            subtitulo: 'Uso del sistema',
          ),
        ),
      ),
    ),

    // PASO 10: Muestra una Tarjeta Servidor individual con datos de prueba
    10 => const Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: SizedBox(
            width: 200, // Le damos ancho porque va dentro de un Grid originalmente
            child: TarjetaServidor(
              servidor: Servidor(
                nombre: 'database-render', 
                cpu: 92.0, // Al ser > 85 se pondrá naranja/crítico
                ram: 88.0, 
                conexiones: 340, 
                activo: true
              ),
            ),
          ),
        ),
      ),
    ),

    // PASO 11: Tu pantalla completa con el temporizador y la lista de servidores
    11 => const PantallaDashboard(), 
    
    _ => Scaffold(body: Center(child: Text('Paso $paso: crea el widget primero'))),
  },
));

class Saludo extends StatelessWidget {
  const Saludo({super.key});
  @override
  Widget build(BuildContext context) {   
    return const SelectableText(
      'La Tri está obligada a ganar tras la derrota ante Costa de Marfil.',
      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.deepPurple),
    );
  }
}