import 'package:flutter/material.dart';

class ContadorLimitemp extends StatefulWidget {
  final String       etiqueta;
  final int          limite;
  final Color        color;         
  final VoidCallback? onLimite;     

  const ContadorLimitemp({
    super.key,
    required this.etiqueta,
    this.limite  = 10,
    this.color   = const Color(0xFFFF007F),
    this.onLimite,
  });

  @override
  State<ContadorLimitemp> createState() => _ContadorLimitempState();
}

class _ContadorLimitempState extends State<ContadorLimitemp> {
  int _valor = 0;

  void _incrementar() {
    if (_valor >= widget.limite) return;    
    setState(() => _valor++);
    if (_valor == widget.limite) {
      widget.onLimite?.call();              
    }
  }

  @override
  Widget build(BuildContext context) {
    final enLimite  = _valor >= widget.limite;
    final progreso  = _valor / widget.limite;   

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
          Text(widget.etiqueta,                        
              style: TextStyle(color: widget.color, fontWeight: FontWeight.w600, fontSize: 16)),

          const SizedBox(height: 8),

          // Barra de progreso adaptada
          LinearProgressIndicator(
            value:          progreso,
            color:          enLimite ? const Color(0xFFCF6679) : widget.color,   
            backgroundColor: widget.color.withOpacity(0.15),
          ),

          const SizedBox(height: 8),

          Text(
            '$_valor / ${widget.limite} Huéspedes',                        
            style: TextStyle(
              fontSize:   24,
              fontWeight: FontWeight.bold,
              color:      enLimite ? const Color(0xFFCF6679) : Colors.white,
            ),
          ),

          const SizedBox(height: 8),

          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FilledButton(
                onPressed: enLimite ? null : _incrementar,    
                style: FilledButton.styleFrom(
                  backgroundColor: const Color(0xFFFF007F),
                ),
                child: const Text('Asignar Huésped'),
              ),
              const SizedBox(width: 8),
              TextButton(
                onPressed: () => setState(() => _valor = 0),  
                child: const Text('Vaciar', style: TextStyle(color: Color(0xFF03DAC6))),
              ),
            ],
          ),

          if (enLimite) ...[
            const SizedBox(height: 4),
            const Text('Capacidad máxima alcanzada',
                style: TextStyle(fontSize: 12, color: Color(0xFFCF6679))),
          ],
        ],
      ),
    );
  }
}