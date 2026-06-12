/*import 'dart:io';

void main() {
  const int TOTAL = 5;
  int tarifaMaxima = 0;

  for (int i = 1; i <= TOTAL; i++) {
    stdout.write('Vehiculo $i - Placa: ');
    String placa = stdin.readLineSync()!;

    stdout.write('Vehiculo $i - Horas estacionado: ');
    int horas = int.parse(stdin.readLineSync()!);

    double costo;
    String categoria;

    if (horas == 0) {
      costo = 0;
      categoria = 'Gratis';
    } 
    else if (horas <= 2) {
      costo = horas * 1.50;
      categoria = 'Tarifa normal';
    } 
    else if (horas <= 5) {
      costo = horas * 1.00;
      categoria = 'Tarifa reducida';
    } 
    else {
      costo = 8.00;
      categoria = 'Tarifa maxima';
      tarifaMaxima++;
    }

    print('[$placa] $horas h -> $categoria \$${costo.toStringAsFixed(2)}');
  }

  print('');
  print('=== RESUMEN ===');
  print('Vehiculos con tarifa maxima: $tarifaMaxima');
}*/


import 'dart:io';
void main (){
  const int total = 5;
  int tarifamaxima = 0;
  int horas = 0;

  for (int i =1; i <=total; i ++){
    stdout.write('Veihuclo $i -Placa');
    String placa = stdin.readLineSync()!;
    double costo;
    String categoria;



    if (horas == 0){
      costo = 0;
      categoria ='Gratis';}


    else if ( <= 2){
      costo = 1.50 * horas;
      categoria = 'Normal';}

    else if (horas < 5 )
    costo = 1.00 * horas;
    categoria = 'Reducida';}

    else {
      costo = 8.00;
      categoria = 'Maxima';
      tarifamaxima++;
    }


    }


    }





  }

 

}


