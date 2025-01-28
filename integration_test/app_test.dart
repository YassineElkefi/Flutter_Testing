
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/screens/counter_page.dart';
import 'package:integration_test/integration_test.dart';

void main(){
  
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('end-to-end test', (){

    testWidgets('Tap on the button, verify counter', (WidgetTester tester) async{

      await tester.pumpWidget(MaterialApp(home: CounterPage(),));

      expect(find.text("0"), findsOneWidget);
      final incrementButton = find.byKey(const Key("incrementButton"));
      await tester.tap(incrementButton);
      await tester.pumpAndSettle();
      expect(find.text("1"), findsOneWidget);
    });

  });
}