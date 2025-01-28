
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/screens/counter_page.dart';
import 'package:flutter_testing/screens/login_page.dart';
import 'package:flutter_testing/screens/product_list_page.dart';
import 'package:integration_test/integration_test.dart';

import 'test_utils.dart';

void main(){
  
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('App Integration Tests end to end', (){

    testWidgets('Successfull Login', (WidgetTester tester) async{

      await tester.pumpWidget(const MaterialApp(home: LoginPage()));

      await login(tester, 'eve.holt@reqres.in', 'cityslicka');

      expect(find.byType(ProductListPage), findsOneWidget);

    });

    testWidgets('Add new product', (WidgetTester tester) async{
      await tester.pumpWidget(const MaterialApp(home: LoginPage()));
      await login(tester, 'eve.holt@reqres.in', 'cityslicka');

      await tester.tap(find.byKey(const Key('add_product_button')));
      await tester.pumpAndSettle();
      await tester.enterText(find.byKey(const Key('product_name_field')), 'Product X');
      await tester.tap(find.byKey(const Key('add_product_dialog_button')));
      await tester.pumpAndSettle();

      expect(find.text('Product X'), findsOneWidget);


    });

    testWidgets('Navigate to product Details', (WidgetTester tester) async{
      await tester.pumpWidget(const MaterialApp(home: LoginPage()));
      await login(tester, 'eve.holt@reqres.in', 'cityslicka');
      await tester.tap(find.byKey(const Key('product_1')));
      await tester.pumpAndSettle();

      expect(find.textContaining('Product Details:'), findsOneWidget);

    });

  });
}