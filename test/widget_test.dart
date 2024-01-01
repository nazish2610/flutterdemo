import 'package:ablytest/app/app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main()
{
  testWidgets("calcultor View", (WidgetTester tester) async{
   await tester.pumpWidget(const App());
   expect(find.byKey(const Key("Result")), findsOneWidget);
   expect(find.byKey(const Key("displayOne")), findsOneWidget);
   expect(find.byKey(const Key("displayTwo")), findsOneWidget);

   expect(find.byIcon(CupertinoIcons.add),findsOneWidget);
   expect(find.byIcon(CupertinoIcons.minus),findsOneWidget);
   expect(find.byIcon(CupertinoIcons.multiply),findsOneWidget);
   expect(find.byIcon(CupertinoIcons.divide),findsOneWidget);
   await tester.enterText(find.byKey(const Key("displayOne")),"20");
   await tester.enterText(find.byKey(const Key("displayTwo")),"20");

   await tester.tap(find.byIcon(CupertinoIcons.add));

   await tester.pump();
   expect(find.text("30"),findsOneWidget);


    //expect(find.byType(center), findsOneWidget);
   //expect(find.text("Hello World"), findsOneWidget);
  });
}