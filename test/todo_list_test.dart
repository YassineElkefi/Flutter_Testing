import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/screens/todo_list_page.dart';

void main(){
  
  testWidgets('Add and remove a todo', (WidgetTester tester) async {

    //Add a todo test
    await tester.pumpWidget(const TodoListPage());

    await tester.enterText(find.byType(TextField), "Hi");

    Finder fab = find.byType(FloatingActionButton);

    await tester.tap(fab);
    await tester.pumpAndSettle();

    //Hi0
    //expect(find.text("Hi"), findsOneWidget);
    expect(find.byKey(const Key("Hi0")), findsOneWidget);

    //Remove a todo test

    await tester.drag(find.byKey(const Key("Hi0")), const Offset(500, 0));

    await tester.pumpAndSettle();
    expect(find.byKey(const Key("Hi0")), findsNothing);


  });
}