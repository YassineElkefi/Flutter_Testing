import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/screens/login_page.dart';
import 'package:integration_test/integration_test.dart';

void main(){
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Login integration Test', (){

      testWidgets('Successfull Login', (WidgetTester tester) async{
        await tester.pumpWidget(const MaterialApp(home: LoginPage()));

        final emailField = find.byKey(const Key("emailField"));
        final passwordField = find.byKey(const Key("passwordField"));

        await tester.enterText(emailField, "eve.holt@reqres.in");
        await tester.enterText(passwordField, "cityslicka");

        final loginButton = find.byKey(const Key("loginButton"));
        await tester.tap(loginButton);
        await tester.pumpAndSettle();

        expect(find.textContaining("Login successful :"), findsOneWidget);

      });

      testWidgets('Failed Login', (WidgetTester tester) async{
        await tester.pumpWidget(const MaterialApp(home: LoginPage()));

        final emailField = find.byKey(const Key("emailField"));
        final passwordField = find.byKey(const Key("passwordField"));

        await tester.enterText(emailField, "wrong@gmail.com");
        await tester.enterText(passwordField, "azzazaza");

        final loginButton = find.byKey(const Key("loginButton"));
        await tester.tap(loginButton);
        await tester.pumpAndSettle();

        expect(find.textContaining("Login successful :"), findsNothing);
        expect(find.text('user not found'), findsOneWidget);
  });

});
}