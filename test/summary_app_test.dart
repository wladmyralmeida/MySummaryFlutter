import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_summary/app/app_widget.dart';

void main() {
  testWidgets("Summary App Initialization Test", (WidgetTester tester) async {
    await tester.runAsync(
          () async {
        await tester.pumpWidget(
          AppWidget(clientID: 1),
        );

        expect(find.byKey(ValueKey("testGraphQl")), findsOneWidget);
        expect(find.byKey(ValueKey("testSummaryCard")), findsOneWidget);
      },
    );
  });
}
