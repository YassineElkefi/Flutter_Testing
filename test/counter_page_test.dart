import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/screens/counter_page.dart';

void main() {

  testWidgets('Calculate the Square press test', (WidgetTester tester) async {

    await tester.pumpWidget(const MaterialApp(home: CounterPage()));

    Finder zeroFinder = find.text("0");

    Finder btnFinder = find.byType(ElevatedButton);

    Finder numberField = find.byType(TextField);

    expect(zeroFinder, findsOneWidget);
    expect(btnFinder, findsOneWidget);

    await tester.enterText(numberField, '2');

    await tester.tap(btnFinder);
    await tester.pumpAndSettle();
    
    Finder resultFinder = find.text("4");
    expect(resultFinder, findsOneWidget);
    expect(zeroFinder, findsNothing);
    });
}
