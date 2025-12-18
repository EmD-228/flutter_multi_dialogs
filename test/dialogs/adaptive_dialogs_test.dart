import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_multi_dialogs/flutter_multi_dialogs.dart';

void main() {
  group('Adaptive Dialogs', () {
    testWidgets('showAdaptiveAlertDialog should use Material on Android',
        (tester) async {
      // Simulate Android platform
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              return Scaffold(
                body: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      showAdaptiveAlertDialog(
                        context: context,
                        title: 'Test',
                        content: 'Test content',
                      );
                    },
                    child: const Text('Show Dialog'),
                  ),
                ),
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();

      // Should use Material AlertDialog (not Cupertino)
      expect(find.byType(AlertDialog), findsOneWidget);
      expect(find.byType(CupertinoAlertDialog), findsNothing);
    });

    testWidgets('showAdaptiveSuccessDialog should work', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              return Scaffold(
                body: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      showAdaptiveSuccessDialog(
                        context: context,
                        title: 'Success!',
                        message: 'Operation completed.',
                      );
                    },
                    child: const Text('Show Success'),
                  ),
                ),
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Show Success'));
      await tester.pumpAndSettle();

      expect(find.text('Success!'), findsOneWidget);
      expect(find.text('Operation completed.'), findsOneWidget);
    });

    testWidgets('showAdaptiveErrorDialog should work', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              return Scaffold(
                body: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      showAdaptiveErrorDialog(
                        context: context,
                        title: 'Error',
                        message: 'An error occurred.',
                      );
                    },
                    child: const Text('Show Error'),
                  ),
                ),
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Show Error'));
      await tester.pumpAndSettle();

      expect(find.text('Error'), findsOneWidget);
    });

    testWidgets('showAdaptiveWarningDialog should work', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              return Scaffold(
                body: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      showAdaptiveWarningDialog(
                        context: context,
                        title: 'Warning',
                        message: 'Are you sure?',
                      );
                    },
                    child: const Text('Show Warning'),
                  ),
                ),
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Show Warning'));
      await tester.pumpAndSettle();

      expect(find.text('Warning'), findsOneWidget);
    });

    testWidgets('showAdaptiveInfoDialog should work', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              return Scaffold(
                body: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      showAdaptiveInfoDialog(
                        context: context,
                        title: 'Info',
                        message: 'This is info.',
                      );
                    },
                    child: const Text('Show Info'),
                  ),
                ),
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Show Info'));
      await tester.pumpAndSettle();

      expect(find.text('Info'), findsOneWidget);
    });

    testWidgets('showAdaptiveLoadingDialog should work', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              return Scaffold(
                body: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      showAdaptiveLoadingDialog(
                        context: context,
                        direction: const Direction(
                          message: 'Loading...',
                          orientations: Orientations.horizontal,
                        ),
                      );
                    },
                    child: const Text('Show Loading'),
                  ),
                ),
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Show Loading'));
      await tester.pump();

      // Should show loading indicator
      expect(find.text('Loading...'), findsOneWidget);
    });
  });
}
