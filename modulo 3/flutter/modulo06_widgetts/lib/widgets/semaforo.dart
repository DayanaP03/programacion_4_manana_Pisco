// lib/widgets/semaforo.dart
import 'package:flutter/material.dart';

class SemaforoInteractivo extends StatefulWidget {
  const SemaforoInteractivo({super.key});

  @override
  State<SemaforoInteractivo> createState() => _SemaforoInteractivoState();
}

class _SemaforoInteractivoState extends State<SemaforoInteractivo> {
  // 0 = Rojo, 1 = Amarillo, 2 = Verde
  int _estado = 0;

  void _cambiarLuz() {
    setState(() {
      _estado = (_estado + 1) % 3;
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
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          decoration: BoxDecoration(
            color: Colors.grey.shade900,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            children: [
              _LuzSemaforo(color: Colors.red, encendido: _estado == 0),
              const SizedBox(height: 15),
              _LuzSemaforo(color: Colors.amber, encendido: _estado == 1),
              const SizedBox(height: 15),
              _LuzSemaforo(color: Colors.green, encendido: _estado == 2),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Text(
          textos[_estado],
          style: TextStyle(
            fontSize: 28, 
            fontWeight: FontWeight.bold, 
            color: colores[_estado]
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: _cambiarLuz,
          child: const Text('Avanzar'),
        ),
      ],
    );
  }
}

class _LuzSemaforo extends StatelessWidget {
  final Color color;
  final bool encendido;

  const _LuzSemaforo({required this.color, required this.encendido});

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 300),
      opacity: encendido ? 1.0 : 0.25,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          boxShadow: encendido ? [
            BoxShadow(color: color.withOpacity(0.6), blurRadius: 15, spreadRadius: 2)
          ] : null,
        ),
      ),
    );
  }
}