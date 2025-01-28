import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/screens/my_home_page.dart';

void main(){
  testWidgets("MyHomePage has a title and a message", (WidgetTester tester) async{
    await tester.pumpWidget(const MyHomePage(title: "T", message: "M",));

    Finder titleFinder = find.text("T");
    Finder messageFinder = find.text("M");

    expect(titleFinder, findsOneWidget);
    expect(messageFinder, findsOneWidget);
  });

  testWidgets('Find appBar with title', (WidgetTester tester) async{
    await tester.pumpWidget(const MyHomePage(title: "T", message: "M",));

    Finder appBarFinder = find.byKey(const Key("appBar"));
    
    expect(appBarFinder, findsOneWidget);

    Finder appBarHasTitle = find.descendant(of: appBarFinder, matching: find.text("T"));
    
    expect(appBarHasTitle, findsOneWidget);
  });

  testWidgets('Find widget by type', (WidgetTester tester) async{
    await tester.pumpWidget(const MyHomePage(title: "T", message: "M",));

    Finder centerFinder = find.byType(Center);

    expect(centerFinder, findsOneWidget);
  });

  testWidgets('Find widget by instance', (WidgetTester tester) async{
    
    Widget icon = const Icon(Icons.download_done_outlined);

    await tester.pumpWidget(MyHomePage(title: "T", message: "M", icon: icon,));

    Finder iconFinder = find.byWidget(icon);

    expect(iconFinder, findsOneWidget);
  });
}