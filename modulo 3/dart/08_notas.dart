// ignore: unused_import
import 'dart:io';
void main() {
  // Forma básica
  int nota = 10;

  if (nota >=7) {
    print('Aprobado');
 
  } else  if (nota <7) {
    print('Reporbado 7 ');
  }

  // Operador ternario — para decisiones de una línea
  // condición ? valorSiVerdadero : valorSiFalso
  String estado = nota > 7 ? 'Aprobado ' : 'Reprobado';
  print(estado);

  
}