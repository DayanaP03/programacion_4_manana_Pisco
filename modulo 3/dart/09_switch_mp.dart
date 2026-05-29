void main() {

  String estadoHabitacion = '404';

  switch (estadoHabitacion) {
    case '200':
      print('Habitación disponible');
    case '201':
      print('Reserva creada');
    case '400':
      print('Solicitud inválida');
    case '401':
      print('Acceso no autorizado');
    case '404':
      print('Habitación no encontrada');
    case '500':
      print('Error del sistema del hotel');
    default:
      print('Estado desconocido');
  }

  String descripcionEstado = switch (estadoHabitacion) {
    '200' => 'Disponible — habitación lista',
    '201' => 'Creada — reserva registrada',
    '204' => 'Sin contenido — sin información',
    '400' => 'Error — datos inválidos',
    '401' => 'Sin acceso — usuario no autorizado',
    '403' => 'Prohibido — acceso denegado',
    '404' => 'No encontrada — habitación no existe',
    '500' => 'Error interno del hotel',
    _ => 'Estado desconocido',
  };

  print(descripcionEstado);

  int codigoHabitacion = 404;

  String categoriaHabitacion = switch (codigoHabitacion) {
    200 || 201 || 204 => 'Habitación OK',
    300 || 301 || 302 => 'Reubicación de habitación',
    400 || 401 || 403 || 404 => 'Problema en reserva',
    500 || 502 || 503 => 'Falla del sistema del hotel',
    _ => 'Estado no identificado',
  };

  print(categoriaHabitacion);

  double temperaturaHotel = 39.0;

  String alertaHotel = switch (temperaturaHotel) {
    double t when t >= 40.0 => '🚨 Emergencia en el hotel',
    double t when t >= 38.5 => '🔴 Cliente con fiebre alta',
    double t when t >= 37.5 => '🟡 Cliente con fiebre leve',
    double t when t >= 36.0 => '🟢 Estado normal del huésped',
    _ => '🔵 Estado fuera de rango',
  };

  print(alertaHotel);

  Object respuestaReserva = {
    'id': 101,
    'cliente': 'Dayana Pérez',
    'habitacion': 305,
    'estado': 'confirmada'
  };

  String resultadoReserva = switch (respuestaReserva) {
    Map<String, dynamic> m when m.containsKey('error') =>
        'Error en reserva: ${m['error']}',
    Map<String, dynamic> m =>
        'Reserva: ${m['cliente']} — Habitación ${m['habitacion']}',
    List<dynamic> lista =>
        'Lista de reservas: ${lista.length}',
    String texto =>
        'Mensaje: $texto',
    _ =>
        'Respuesta desconocida',
  };

  print(resultadoReserva);
}