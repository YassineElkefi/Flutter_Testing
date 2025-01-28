import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future login(WidgetTester tester, String email, String passwword) async{
  final emailField = find.byKey(const Key("emailField"));
  final passwordField = find.byKey(const Key("passwordField"));

  await tester.enterText(emailField, "eve.holt@reqres.in");
  await tester.enterText(passwordField, "cityslicka");

  final loginButton = find.byKey(const Key("loginButton"));
  await tester.tap(loginButton);
  await tester.pumpAndSettle();
}