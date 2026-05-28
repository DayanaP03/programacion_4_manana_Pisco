class ReservaHotel {

  final String huesped;
  double _saldo;

  ReservaHotel(this.huesped, double saldoInicial)
      : _saldo = saldoInicial;

  double get saldo => _saldo;

  void pagarReserva(double monto) {

    if (monto <= 0) {
      throw ArgumentError('El monto debe ser positivo');
    }

    _saldo += monto;

    print(
      'Pago de reserva: \$$monto. Total acumulado: \$$_saldo'
    );
  }

  void descontarServicio(double monto) {

    if (monto <= 0) {
      throw ArgumentError('El monto debe ser positivo');
    }

    if (monto > _saldo) {
      throw StateError('Saldo insuficiente');
    }

    _saldo -= monto;

    print(
      'Cobro de servicio: \$$monto. Saldo restante: \$$_saldo'
    );
  }
}

void main() {

  final reserva = ReservaHotel(
    'María López',
    500.0,
  );

  reserva.pagarReserva(200.0);

  reserva.descontarServicio(150.0);

  print(reserva.saldo);
}