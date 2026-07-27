import 'package:flutter/material.dart';

class PantallaDashboard extends StatelessWidget {
  const PantallaDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);
    final colores = tema.colorScheme;
    final ancho = MediaQuery.sizeOf(context).width;
    final columnas = ancho >= 1100 ? 4 : (ancho >= 760 ? 2 : 1);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard del Hotel'),
        backgroundColor: colores.primaryContainer,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF0E0E0E), Color(0xFF121212)],
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: const [
                _KpiCard(
                  titulo: 'Habitaciones ocupadas',
                  valor: '86%',
                  icono: Icons.hotel,
                  color: Color(0xFFFF007F),
                ),
                _KpiCard(
                  titulo: 'Check-ins hoy',
                  valor: '42',
                  icono: Icons.login,
                  color: Color(0xFF03DAC6),
                ),
                _KpiCard(
                  titulo: 'Check-outs hoy',
                  valor: '31',
                  icono: Icons.logout,
                  color: Color(0xFF8AB4F8),
                ),
                _KpiCard(
                  titulo: 'Ingresos del día',
                  valor: '\$24,850',
                  icono: Icons.attach_money,
                  color: Color(0xFFCF6679),
                ),
              ],
            ),
            const SizedBox(height: 18),
            Text(
              'Reservas recientes',
              style: tema.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            GridView.count(
              crossAxisCount: columnas,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.55,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                _ReservaCard(
                  nombre: 'Maria Gonzalez',
                  habitacion: 'Suite 402',
                  noches: 3,
                  estado: 'Confirmada',
                ),
                _ReservaCard(
                  nombre: 'Carlos Vega',
                  habitacion: 'Deluxe 215',
                  noches: 2,
                  estado: 'Check-in pendiente',
                ),
                _ReservaCard(
                  nombre: 'Lucia Salazar',
                  habitacion: 'Master 501',
                  noches: 5,
                  estado: 'VIP',
                ),
                _ReservaCard(
                  nombre: 'Andres Molina',
                  habitacion: 'Estandar 109',
                  noches: 1,
                  estado: 'Pagada',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _KpiCard extends StatelessWidget {
  final String titulo;
  final String valor;
  final IconData icono;
  final Color color;

  const _KpiCard({
    required this.titulo,
    required this.valor,
    required this.icono,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 220),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: color.withOpacity(0.35)),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: color.withOpacity(0.20),
              child: Icon(icono, color: color),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(titulo,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: Colors.white70)),
                  const SizedBox(height: 4),
                  Text(valor,
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                          )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ReservaCard extends StatelessWidget {
  final String nombre;
  final String habitacion;
  final int noches;
  final String estado;

  const _ReservaCard({
    required this.nombre,
    required this.habitacion,
    required this.noches,
    required this.estado,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF171717),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFF2A2A2A)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            nombre,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            habitacion,
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: const Color(0xFFFF007F)),
          ),
          const SizedBox(height: 6),
          Text(
            '$noches noche(s)',
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Colors.white70),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFF03DAC6).withOpacity(0.15),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              estado,
              style: const TextStyle(
                color: Color(0xFF03DAC6),
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}