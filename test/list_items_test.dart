import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/screens/list_items_page.dart';

void main(){

  testWidgets('Finds a deep items in a long list', (WidgetTester tester) async{
    await tester.pumpWidget(ListItemsPage(items: List<String>.generate(10000, (i) => 'Item $i')));

    Finder scrollableWidget = find.byType(Scrollable);
    Finder itemFinder = find.text("Item 300");

    await tester.scrollUntilVisible(itemFinder, 500, scrollable: scrollableWidget);

    expect(itemFinder, findsOneWidget);
  });
}