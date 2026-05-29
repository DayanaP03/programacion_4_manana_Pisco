class HabitacionHotel {

  final String numero;
  final int capacidad;

  HabitacionHotel(this.numero, this.capacidad);

  String tipoHabitacion() => 'Habitación estándar';

  void mostrarInformacion() {

    print(
      'Habitación $numero | '
      'Capacidad: $capacidad personas | '
      'Tipo: ${tipoHabitacion()}'
    );
  }
}


class Suite extends HabitacionHotel {

  Suite(super.numero, super.capacidad);

  @override
  String tipoHabitacion() => 'Suite de lujo';

  void servicioVIP() {

    print(
      'La suite $numero incluye servicio VIP ⭐'
    );
  }
}

class HabitacionFamiliar extends HabitacionHotel {

  HabitacionFamiliar(super.numero, super.capacidad);

  @override
  String tipoHabitacion() => 'Habitación familiar';

  void desayunoIncluido() {

    print(
      'La habitación $numero incluye desayuno 🍳'
    );
  }
}

void main() {

  final suite = Suite('501', 2);

  final familiar = HabitacionFamiliar('203', 5);

  suite.mostrarInformacion();

  familiar.mostrarInformacion();

  suite.servicioVIP();

  familiar.desayunoIncluido();
}