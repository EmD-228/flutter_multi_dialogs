import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:multiple_dialog/multiple_dialog.dart';

void main() {
  group('showAlertDialog', () {
    testWidgets('should display alert dialog with title and content', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  showAlertDialog(
                    context: context,
                    title: const Text('Test Title'),
                    content: const Text('Test Content'),
                  );
                },
                child: const Text('Show Alert'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Alert'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));

      expect(find.text('Test Title'), findsOneWidget);
      expect(find.text('Test Content'), findsOneWidget);
      expect(find.byType(AlertDialog), findsOneWidget);
      
      // Close dialog by tapping barrier
      await tester.tapAt(const Offset(10, 10));
      await tester.pump();
    });

    testWidgets('should display alert dialog with actions', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  showAlertDialog(
                    context: context,
                    title: const Text('Confirm'),
                    content: const Text('Are you sure?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('OK'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('Cancel'),
                      ),
                    ],
                  );
                },
                child: const Text('Show Alert'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Alert'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));

      expect(find.text('OK'), findsOneWidget);
      expect(find.text('Cancel'), findsOneWidget);
      
      // Close dialog
      await tester.tap(find.text('Cancel'));
      await tester.pumpAndSettle();
    });

    testWidgets('should close dialog when barrier is tapped', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  showAlertDialog(
                    context: context,
                    title: const Text('Test'),
                    barrierDismissible: true,
                  );
                },
                child: const Text('Show Alert'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Alert'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));

      expect(find.byType(AlertDialog), findsOneWidget);

      // Tap outside the dialog (barrier)
      await tester.tapAt(const Offset(10, 10));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));

      expect(find.byType(AlertDialog), findsNothing);
    });
  });

  group('showIconAlertDialog', () {
    testWidgets('should display icon alert dialog with icon', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  showIconAlertDialog(
                    context: context,
                    icon: Icons.check_circle,
                    title: const Text('Success'),
                    content: const Text('Operation completed'),
                  );
                },
                child: const Text('Show Icon Alert'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Icon Alert'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));

      expect(find.byIcon(Icons.check_circle), findsOneWidget);
      expect(find.text('Success'), findsOneWidget);
      expect(find.text('Operation completed'), findsOneWidget);
      
      // Close dialog
      await tester.tapAt(const Offset(10, 10));
      await tester.pump();
    });

    testWidgets('should display icon alert dialog with custom icon widget', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  showIconAlertDialog(
                    context: context,
                    iconWidget: const Icon(Icons.warning, color: Colors.orange),
                    title: const Text('Warning'),
                  );
                },
                child: const Text('Show Icon Alert'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Icon Alert'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));

      expect(find.byIcon(Icons.warning), findsOneWidget);
      expect(find.text('Warning'), findsOneWidget);
      
      // Close dialog
      await tester.tapAt(const Offset(10, 10));
      await tester.pump();
    });
  });
}

