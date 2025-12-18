import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_multi_dialogs/flutter_multi_dialogs.dart';

void main() {
  group('showCustomAlertDialog', () {
    testWidgets('should display custom alert dialog with builder', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  showCustomAlertDialog(
                    context: context,
                    dialogBuilder: const DialogBuilder(
                      simpleBuilder: SimpleBuilder(
                        title: Text('Custom Title'),
                        content: Text('Custom Content'),
                      ),
                    ),
                    confirmWidget: const Text('Confirm'),
                    cancelWidget: const Text('Cancel'),
                    onConfirmCallBack: () => Navigator.of(context).pop(),
                    onCancelCallBack: () => Navigator.of(context).pop(),
                  );
                },
                child: const Text('Show Custom Alert'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Custom Alert'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));

      expect(find.text('Custom Title'), findsOneWidget);
      expect(find.text('Custom Content'), findsOneWidget);
      expect(find.text('Confirm'), findsOneWidget);
      expect(find.text('Cancel'), findsOneWidget);
      
      // Close dialog
      await tester.tap(find.text('Cancel'));
      await tester.pumpAndSettle();
    });

    testWidgets('should auto-close when action is tapped', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  showCustomAlertDialog(
                    context: context,
                    dialogBuilder: const DialogBuilder(
                      simpleBuilder: SimpleBuilder(),
                    ),
                    confirmWidget: const Text('OK'),
                    onConfirmCallBack: () {},
                    autoCloseOnAction: true,
                  );
                },
                child: const Text('Show Custom Alert'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Custom Alert'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));

      expect(find.byType(AlertDialog), findsOneWidget);

      await tester.tap(find.text('OK'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));

      expect(find.byType(AlertDialog), findsNothing);
    });

    testWidgets('should not auto-close when autoCloseOnAction is false', (WidgetTester tester) async {
      bool callbackCalled = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  showCustomAlertDialog(
                    context: context,
                    dialogBuilder: const DialogBuilder(
                      simpleBuilder: SimpleBuilder(),
                    ),
                    confirmWidget: const Text('OK'),
                    onConfirmCallBack: () {
                      callbackCalled = true;
                    },
                    autoCloseOnAction: false,
                  );
                },
                child: const Text('Show Custom Alert'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Custom Alert'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));

      await tester.tap(find.text('OK'));
      await tester.pump();

      expect(callbackCalled, true);
      // Dialog should still be visible
      expect(find.byType(AlertDialog), findsOneWidget);
      
      // Close dialog manually
      await tester.tapAt(const Offset(10, 10));
      await tester.pump();
    });
  });
}

