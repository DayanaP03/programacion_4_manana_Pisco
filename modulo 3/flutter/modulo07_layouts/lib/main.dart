// lib/main.dart
import 'package:flutter/material.dart';
import 'widgets/tarjeta_log.dart';
import 'widgets/fila_estado.dart';
import 'widgets/avatar_badge.dart'; // Se usa tanto en el Paso 4 como en el Paso 5

// ┌──────────────────────────────────────────────────────────────────┐
// │  Cambia este número y guarda (Ctrl+S) para navegar entre pasos.  │
// │  1  Paso 1  Container — decoración y espaciado                   │
// │  2  Paso 2  Column — TarjetaLog                                  │
// │  3  Paso 3  Row + Expanded + Spacer — FilaEstado                │
// │  4  Paso 4  Stack + Positioned — AvatarBadge                    │
// │  5  Paso 5  Topología de Red (Nueva Pantalla Completa)           │ <-- ¡PROBAR PASO 5!
// └──────────────────────────────────────────────────────────────────┘
const int paso = 5; 

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
    useMaterial3: true,
  ),
  home: switch (paso) {
    1 => _paso1(),
    2 => Scaffold(
      body: ListView(
        children: [
          TarjetaLog(nivel: 'ERROR', componente: 'auth-service',
              mensaje:   'Token expirado — usuario forzado a re-login',
              timestamp: DateTime.now()),
          TarjetaLog(nivel: 'WARN',  componente: 'db-pool',
              mensaje:   'Conexiones disponibles: 2 / 10',
              timestamp: DateTime.now().subtract(const Duration(minutes: 2))),
          TarjetaLog(nivel: 'INFO',  componente: 'scheduler',
              mensaje:   'Tarea de backup completada',
              timestamp: DateTime.now().subtract(const Duration(minutes: 5))),
          TarjetaLog(nivel: 'DEBUG', componente: 'http-client',
              mensaje:   'GET /api/status → 200 OK (38ms)',
              timestamp: DateTime.now().subtract(const Duration(minutes: 8))),
        ],
      ),
    ),
    3 => const Scaffold(
      body: Column(
        children: [
          FilaEstado(nombre: 'nginx-proxy',   detalle: '10.0.0.5 · 45ms',          activo: true),
          Divider(height: 1),
          FilaEstado(nombre: 'db-primary',    detalle: '10.0.0.12 · 8ms',           activo: true),
          Divider(height: 1),
          FilaEstado(nombre: 'backup-worker', detalle: '10.0.0.30 · sin respuesta', activo: false),
          Divider(height: 1),
          FilaEstado(nombre: 'api-gateway-produccion-region-us-east',
                     detalle: '10.0.0.8 · 12ms', activo: true),
        ],
      ),
    ),
    4 => const Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AvatarBadge(nombre: 'web-01', alertas: 2,  activo: true),  
            SizedBox(width: 24),
            AvatarBadge(nombre: 'db-01',  alertas: 0,  activo: true),
            SizedBox(width: 24),
            AvatarBadge(nombre: 'worker', alertas: 0,  activo: false),
            SizedBox(width: 24),
            AvatarBadge(nombre: 'cache',  alertas: 11, activo: true),
          ],
        ),
      ),
    ),
    
    // --- PASO 5 COMPLETO Y LISTO PARA PROBAR ---
    5 => const PantallaTopologia(),
    
    _ => Scaffold(body: Center(child: Text('Paso $paso: crea el widget primero'))),
  },
));

// ─── Paso 1 — Container (vive aquí en main.dart) ─────────────────────
Widget _paso1() => Scaffold(
  body: Center(
    child: Container(
      width:   double.infinity,
      height:  80,
      margin: const EdgeInsets.all(24),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),  
      decoration: BoxDecoration(
        color:        Colors.indigo.shade50,
        borderRadius: BorderRadius.circular(0),
        border:       const Border(left: BorderSide(color: Colors.indigo, width: 4)),
        boxShadow: [
          BoxShadow(
            color:      Colors.black.withOpacity(0.03),
            blurRadius: 8,
            offset:     const Offset(0, 2),
          ),
        ],
      ),
      child: const Text('Servidor web-01', style: TextStyle(fontWeight: FontWeight.bold)),
    ),
  ),
);


// =====================================================================
//  AQUÍ ESTÁ TU EJERCICIO DE TOPOLOGÍA INTEGRADO SIN ARCHIVOS EXTERNOS
// =====================================================================

// lib/models/dispositivo.dart (Inyectado localmente)
class InfoDispositivo {
  final String       nombre;
  final String       tipo;       // 'router', 'switch', 'server', 'endpoint'
  final String       ip;
  final bool         activo;
  final int          alertas;
  final List<String> etiquetas;

  const InfoDispositivo({
    required this.nombre,
    required this.tipo,
    required this.ip,
    required this.activo,
    this.alertas   = 0,
    this.etiquetas = const [],
  });
}

// lib/widgets/chip_resumen.dart (Inyectado localmente)
class ChipResumen extends StatelessWidget {
  final IconData icono;
  final String   texto;
  final Color    color;

  const ChipResumen({
    super.key,
    required this.icono,
    required this.texto,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icono, size: 14, color: color),
        const SizedBox(width: 4),
        Text(texto, style: TextStyle(fontSize: 12, color: color, fontWeight: FontWeight.w600)),
      ],
    );
  }
}

// lib/widgets/fila_dispositivo.dart (Inyectado localmente)
class FilaDispositivo extends StatelessWidget {
  final InfoDispositivo dispositivo;

  const FilaDispositivo({super.key, required this.dispositivo});

  IconData get _icono => switch (dispositivo.tipo) {
    'router'   => Icons.router,
    'switch'   => Icons.device_hub,
    'server'   => Icons.dns,
    'endpoint' => Icons.computer,
    _          => Icons.devices,
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Llama directamente al AvatarBadge importado en la línea 5
          AvatarBadge(
            nombre:  dispositivo.nombre,
            alertas: dispositivo.alertas,
            activo:  dispositivo.activo,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        dispositivo.nombre,
                        style:    const TextStyle(fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Icon(_icono, size: 16, color: Colors.grey.shade500),
                  ],
                ),
                Text(dispositivo.ip, style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
                const SizedBox(height: 6),
                Wrap(
                  spacing: 4, runSpacing: 4,
                  children: dispositivo.etiquetas.map((tag) =>
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color:        Colors.indigo.shade50,
                        borderRadius: BorderRadius.circular(4),
                        border:       Border.all(color: Colors.indigo.shade200),
                      ),
                      child: Text(tag, style: TextStyle(fontSize: 10, color: Colors.indigo.shade700, fontWeight: FontWeight.w500)),
                    ),
                  ).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// lib/screens/pantalla_topologia.dart (Inyectado localmente)
class PantallaTopologia extends StatelessWidget {
  const PantallaTopologia({super.key});

  @override
  Widget build(BuildContext context) {
    final dispositivos = [
      const InfoDispositivo(
        nombre: 'core-router', tipo: 'router',
        ip: '10.0.0.1', activo: true, alertas: 2,
        etiquetas: ['BGP', 'OSPF', 'Gateway'],
      ),
      const InfoDispositivo(
        nombre: 'sw-distribucion', tipo: 'switch',
        ip: '10.0.1.1', activo: true, alertas: 0,
        etiquetas: ['L3', 'VLAN 10', 'VLAN 20'],
      ),
      const InfoDispositivo(
        nombre: 'prod-web-01', tipo: 'server',
        ip: '10.0.2.10', activo: true, alertas: 1,
        etiquetas: ['nginx', 'TLS'],
      ),
      const InfoDispositivo(
        nombre: 'prod-db-01', tipo: 'server',
        ip: '10.0.2.20', activo: true, alertas: 3,
        etiquetas: ['PostgreSQL', 'Primary'],
      ),
      const InfoDispositivo(
        nombre: 'backup-srv', tipo: 'server',
        ip: '10.0.3.5', activo: false, alertas: 0,
        etiquetas: ['Backup', 'Offsite'],
      ),
    ];

    final totalAlertas = dispositivos.fold(0, (s, d) => s + d.alertas);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Topología de Red'),
        actions: [
          IconButton(icon: const Icon(Icons.filter_list), onPressed: () {}),
          IconButton(icon: const Icon(Icons.refresh),     onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          Container(
            color:   Theme.of(context).colorScheme.surfaceContainerHighest,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                ChipResumen(icono: Icons.hub, texto: '${dispositivos.length} dispositivos', color: Colors.indigo),
                const SizedBox(width: 16),
                ChipResumen(icono: Icons.circle, texto: '${dispositivos.where((d) => d.activo).length} activos', color: Colors.green),
                const SizedBox(width: 16),
                ChipResumen(icono: Icons.warning_amber, texto: '$totalAlertas alertas', color: Colors.orange),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding:          const EdgeInsets.symmetric(vertical: 8),
              itemCount:        dispositivos.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder:      (_, i)  => FilaDispositivo(dispositivo: dispositivos[i]),
            ),
          ),
        ],
      ),
    );
  }
}