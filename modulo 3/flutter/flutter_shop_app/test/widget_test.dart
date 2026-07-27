import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_shop_app/main.dart';
import 'package:flutter_shop_app/presentation/navigation/app_router.dart';

void main() {
  testWidgets('app boots', (WidgetTester tester) async {
    final router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (_, __) => const Scaffold(
            body: Text('Test App'),
          ),
        ),
      ],
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          routerProvider.overrideWithValue(router),
        ],
        child: const FlutterShopApp(),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('Test App'), findsOneWidget);
  });
}
