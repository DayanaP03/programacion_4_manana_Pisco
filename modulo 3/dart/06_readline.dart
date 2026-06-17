import 'dart:io';

void main() {
  print ('Ingresa su nombre: ');
  String? nombre = stdin.readLineSync(); 
  print ('Hola $nombre');


  print ('Ingresa un numero entero: ');
  int numero = int.parse(stdin.readLineSync()!);
  print ('Numero  $numero');

  print ('Ingrese un decima:  ');
  double valor = double.parse(stdin.readLineSync()!);
  print ('Valor $valor');


    print('Ingrese el rpimern numero :');
    int a = int.parse(stdin.readLineSync()!);

    print('Ingrese el segundo numero :');
    int b = int.parse(stdin.readLineSync()!);

    int suma = a + b;
    print('La suma es: $suma');


}
