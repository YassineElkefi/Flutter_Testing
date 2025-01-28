import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/screens/counter_page.dart';

void main() {

  testWidgets('Counter increment Press test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: CounterPage()));

    Finder zeroFinder = find.text("0");

    Finder btnFinder = find.byType(ElevatedButton);

    expect(zeroFinder, findsOneWidget);
    expect(btnFinder, findsOneWidget);

    await tester.tap(btnFinder);
    await tester.pumpAndSettle();
    
    Finder oneFinder = find.text("1");
    expect(oneFinder, findsOneWidget);
    expect(zeroFinder, findsNothing);
    });
}
