void main() {

  final calcularTotalHabitacion = (double precioNoche) =>
      precioNoche * 3;

  print(calcularTotalHabitacion(120.0));

  final calcularDescuentoHotel =
      (double precio, double porcentaje) {
    final descuento = precio * (porcentaje / 100);
    return precio - descuento;
  };

  print(calcularDescuentoHotel(200.0, 10.0));

  final habitaciones = [305, 101, 204, 502, 110];

  habitaciones.sort((a, b) => a.compareTo(b));

  print(habitaciones);

  final clientes = ['Ana', 'Luis', 'Carlos', 'María'];

  clientes.sort((a, b) => b.compareTo(a));

  print(clientes);
}