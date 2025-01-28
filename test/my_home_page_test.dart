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
}