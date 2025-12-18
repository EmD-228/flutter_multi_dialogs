import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_multi_dialogs/flutter_multi_dialogs.dart';

void main() {
  group('showCustomDialog', () {
    testWidgets('should display custom dialog with child',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  showCustomDialog(
                    context: context,
                    child: const Text('Custom Content'),
                  );
                },
                child: const Text('Show Custom'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Custom'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));

      expect(find.text('Custom Content'), findsOneWidget);

      // Close dialog
      await tester.tapAt(const Offset(10, 10));
      await tester.pump();
    });

    testWidgets('should throw FormatException for invalid gravity',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  showCustomDialog(
                    context: context,
                    gravity: 2.0, // Invalid: should be between -1 and 1
                    child: const Text('Test'),
                  );
                },
                child: const Text('Show Custom'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Custom'));
      await tester.pump();

      // The exception should be thrown during build
      expect(tester.takeException(), isA<FormatException>());
    });

    testWidgets('should display custom dialog with center gravity',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  showCustomDialog(
                    context: context,
                    gravity: 0,
                    child: const Text('Centered'),
                  );
                },
                child: const Text('Show Custom'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Custom'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));

      expect(find.text('Centered'), findsOneWidget);

      // Close dialog
      await tester.tapAt(const Offset(10, 10));
      await tester.pump();
    });
  });

  group('showCustomSimpleDialog', () {
    testWidgets('should display custom simple dialog',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  showCustomSimpleDialog(
                    context: context,
                    simpleBuilder: const SimpleBuilder(title: Text('Title')),
                    children: const [
                      Text('Child 1'),
                      Text('Child 2'),
                    ],
                  );
                },
                child: const Text('Show Simple'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Simple'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));

      expect(find.text('Title'), findsOneWidget);
      expect(find.text('Child 1'), findsOneWidget);
      expect(find.text('Child 2'), findsOneWidget);

      // Close dialog
      await tester.tapAt(const Offset(10, 10));
      await tester.pump();
    });
  });
}
