void main() {
  final nombre = 'Ana';
  final edad   = 28;

  print('Hola, $nombre');                    

  print('${nombre.toUpperCase()} tiene ${edad + 1} años el próximo año');


  final tarjeta = '''
Nombre: $nombre
Edad:   $edad
Mayor:  ${edad >= 18 ? 'Sí' : 'No'}
  ''';
  print(tarjeta);
 

  final ruta = r'C:\Users\Ana\Documents';  
  print(ruta);

  // ignore: unused_local_variable
  final saludo = 'Hola, ' + nombre + '!';

  print('flutter'.toUpperCase());          
  print('  Flutter  '.trim());             
  print('Flutter'.contains('lut'));         
  print('Flutter'.replaceAll('t', 'T'));    
  print('a,b,c'.split(','));               
  print('Flutter'.substring(0, 4));        
  print('Flutter'.startsWith('Flu'));       
  print('abc'.padLeft(5, '0'));             
}