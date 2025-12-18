import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:multiple_dialog/multiple_dialog.dart';

void main() {
  group('showSuccessDialog', () {
    testWidgets('should display success dialog with check icon', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  showSuccessDialog(
                    context: context,
                    title: 'Success!',
                    message: 'Operation completed successfully.',
                  );
                },
                child: const Text('Show Success'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Success'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));

      expect(find.byIcon(Icons.check_circle), findsOneWidget);
      expect(find.text('Success!'), findsOneWidget);
      expect(find.text('Operation completed successfully.'), findsOneWidget);
      expect(find.text('OK'), findsOneWidget);
      
      // Close dialog
      await tester.tap(find.text('OK'));
      await tester.pump();
    });

    testWidgets('should call onConfirm callback', (WidgetTester tester) async {
      bool callbackCalled = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  showSuccessDialog(
                    context: context,
                    message: 'Success',
                    onConfirm: () {
                      callbackCalled = true;
                    },
                  );
                },
                child: const Text('Show Success'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Success'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));

      await tester.tap(find.text('OK'));
      await tester.pump();

      expect(callbackCalled, true);
    });
  });

  group('showErrorDialog', () {
    testWidgets('should display error dialog with error icon', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  showErrorDialog(
                    context: context,
                    title: 'Error',
                    message: 'An error occurred.',
                  );
                },
                child: const Text('Show Error'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Error'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));

      expect(find.byIcon(Icons.error), findsOneWidget);
      expect(find.text('Error'), findsOneWidget);
      expect(find.text('An error occurred.'), findsOneWidget);
      
      // Close dialog
      await tester.tap(find.text('OK'));
      await tester.pump();
    });

    testWidgets('should display error details when provided', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  showErrorDialog(
                    context: context,
                    message: 'Error occurred',
                    error: 'Error code: 500',
                  );
                },
                child: const Text('Show Error'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Error'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));

      expect(find.text('Error code: 500'), findsOneWidget);
      
      // Close dialog
      await tester.tap(find.text('OK'));
      await tester.pump();
    });
  });

  group('showWarningDialog', () {
    testWidgets('should display warning dialog with warning icon', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  showWarningDialog(
                    context: context,
                    title: 'Warning',
                    message: 'Are you sure?',
                  );
                },
                child: const Text('Show Warning'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Warning'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));

      expect(find.byIcon(Icons.warning), findsOneWidget);
      expect(find.text('Warning'), findsOneWidget);
      expect(find.text('Are you sure?'), findsOneWidget);
      
      // Close dialog
      await tester.tap(find.text('OK'));
      await tester.pump();
    });

    testWidgets('should display both confirm and cancel buttons', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  showWarningDialog(
                    context: context,
                    message: 'Continue?',
                    confirmText: 'Yes',
                    cancelText: 'No',
                  );
                },
                child: const Text('Show Warning'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Warning'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));

      expect(find.text('Yes'), findsOneWidget);
      expect(find.text('No'), findsOneWidget);
      
      // Close dialog
      await tester.tap(find.text('No'));
      await tester.pump();
    });
  });

  group('showInfoDialog', () {
    testWidgets('should display info dialog with info icon', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  showInfoDialog(
                    context: context,
                    title: 'Information',
                    message: 'This is an info message.',
                  );
                },
                child: const Text('Show Info'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Info'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));

      expect(find.byIcon(Icons.info), findsOneWidget);
      expect(find.text('Information'), findsOneWidget);
      expect(find.text('This is an info message.'), findsOneWidget);
      
      // Close dialog
      await tester.tap(find.text('OK'));
      await tester.pump();
    });
  });
}

