// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:modulo08_material3/main.dart';

void main() {
  testWidgets('Muestra la pantalla de catalogo de botones', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const HotelBotonesApp());

    expect(find.text('Acciones de Reserva'), findsOneWidget);
    expect(find.text('FilledButton — Confirmar reserva'), findsOneWidget);
  });
}
