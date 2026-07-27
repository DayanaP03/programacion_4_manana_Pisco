import 'package:flutter/material.dart';

class FormularioReservaHotelMp extends StatefulWidget {
  final void Function(Map<String, String> datos) onGuardar;

  const FormularioReservaHotelMp({
    super.key,
    required this.onGuardar,
  });

  @override
  State<FormularioReservaHotelMp> createState() =>
      _FormularioReservaHotelMpState();
}

class _FormularioReservaHotelMpState extends State<FormularioReservaHotelMp> {
  final _formKey = GlobalKey<FormState>();

  final _ctrlHuesped = TextEditingController();
  final _ctrlEmail = TextEditingController();
  final _ctrlNoches = TextEditingController(text: '1');
  final _ctrlFechaIngreso = TextEditingController();

  String _tipoHabitacion = 'Suite Deluxe';
  bool _desayunoIncluido = true;

  @override
  void dispose() {
    _ctrlHuesped.dispose();
    _ctrlEmail.dispose();
    _ctrlNoches.dispose();
    _ctrlFechaIngreso.dispose();
    super.dispose();
  }

  void _limpiar() {
    _formKey.currentState?.reset();
    _ctrlHuesped.clear();
    _ctrlEmail.clear();
    _ctrlNoches.text = '1';
    _ctrlFechaIngreso.clear();
    setState(() {
      _tipoHabitacion = 'Suite Deluxe';
      _desayunoIncluido = true;
    });
  }

  void _guardar() {
    if (!_formKey.currentState!.validate()) return;

    widget.onGuardar({
      'huesped': _ctrlHuesped.text.trim(),
      'email': _ctrlEmail.text.trim(),
      'noches': _ctrlNoches.text.trim(),
      'fechaIngreso': _ctrlFechaIngreso.text.trim(),
      'tipoHabitacion': _tipoHabitacion,
      'desayuno': _desayunoIncluido.toString(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: _ctrlHuesped,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              labelText: 'Nombre del huesped',
              hintText: 'Ana Torres',
              prefixIcon: Icon(Icons.person_outline),
              border: OutlineInputBorder(),
            ),
            validator: (v) {
              if (v == null || v.trim().isEmpty) {
                return 'El nombre es obligatorio';
              }
              if (v.trim().length < 3) {
                return 'Minimo 3 caracteres';
              }
              return null;
            },
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _ctrlEmail,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              labelText: 'Correo',
              hintText: 'huesped@correo.com',
              prefixIcon: Icon(Icons.alternate_email),
              border: OutlineInputBorder(),
            ),
            validator: (v) {
              if (v == null || v.trim().isEmpty) {
                return 'El correo es obligatorio';
              }
              if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(v.trim())) {
                return 'Correo invalido';
              }
              return null;
            },
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _ctrlNoches,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              labelText: 'Noches',
              prefixIcon: Icon(Icons.night_shelter_outlined),
              border: OutlineInputBorder(),
            ),
            validator: (v) {
              final n = int.tryParse((v ?? '').trim());
              if (n == null) return 'Ingresa un numero';
              if (n < 1 || n > 30) return 'Rango: 1 a 30 noches';
              return null;
            },
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _ctrlFechaIngreso,
            textInputAction: TextInputAction.done,
            decoration: const InputDecoration(
              labelText: 'Fecha de ingreso',
              hintText: '2026-08-05',
              prefixIcon: Icon(Icons.event_available_outlined),
              border: OutlineInputBorder(),
            ),
            validator: (v) {
              if (v == null || v.trim().isEmpty) {
                return 'La fecha es obligatoria';
              }
              if (!RegExp(r'^\d{4}-\d{2}-\d{2}$').hasMatch(v.trim())) {
                return 'Formato: YYYY-MM-DD';
              }
              return null;
            },
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField<String>(
            value: _tipoHabitacion,
            decoration: const InputDecoration(
              labelText: 'Tipo de habitacion',
              prefixIcon: Icon(Icons.hotel_outlined),
              border: OutlineInputBorder(),
            ),
            items: const [
              DropdownMenuItem(value: 'Suite Deluxe', child: Text('Suite Deluxe')),
              DropdownMenuItem(value: 'Doble Estandar', child: Text('Doble Estandar')),
              DropdownMenuItem(value: 'Junior Suite', child: Text('Junior Suite')),
              DropdownMenuItem(value: 'Individual', child: Text('Individual')),
            ],
            onChanged: (v) => setState(() => _tipoHabitacion = v ?? _tipoHabitacion),
          ),
          const SizedBox(height: 8),
          SwitchListTile(
            value: _desayunoIncluido,
            onChanged: (v) => setState(() => _desayunoIncluido = v),
            title: const Text('Desayuno incluido'),
            subtitle: const Text('Agrega desayuno buffet a la reserva'),
            secondary: const Icon(Icons.free_breakfast_outlined),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: _limpiar,
                  child: const Text('Limpiar'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                flex: 2,
                child: FilledButton.icon(
                  onPressed: _guardar,
                  icon: const Icon(Icons.book_online_outlined),
                  label: const Text('Guardar reserva'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}