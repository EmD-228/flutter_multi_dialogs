import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_multi_dialogs/flutter_multi_dialogs.dart';

void main() {
  group('LoadingDialog', () {
    testWidgets('should display loading dialog with vertical orientation',
        (WidgetTester tester) async {
      const direction = Direction(
        message: 'Loading...',
        orientations: Orientations.vertical,
        width: 100.0,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  showLoadingDialog(
                    context: context,
                    direction: direction,
                  );
                },
                child: const Text('Show Loading'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Loading'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('Loading...'), findsOneWidget);

      // Close the dialog
      await tester.tapAt(const Offset(10, 10));
      await tester.pump();
    });

    testWidgets('should display loading dialog with horizontal orientation',
        (WidgetTester tester) async {
      const direction = Direction(
        message: 'Processing',
        orientations: Orientations.horizontal,
        width: 200.0,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  showLoadingDialog(
                    context: context,
                    direction: direction,
                  );
                },
                child: const Text('Show Loading'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Loading'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('Processing'), findsOneWidget);

      // Close the dialog
      await tester.tapAt(const Offset(10, 10));
      await tester.pump();
    });

    testWidgets('should use custom progress indicator color',
        (WidgetTester tester) async {
      const direction = Direction(
        message: 'Loading...',
        orientations: Orientations.vertical,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  showLoadingDialog(
                    context: context,
                    direction: direction,
                    progressIndicatorColor: Colors.red,
                    progressIndicatorStrokeWidth: 3.0,
                  );
                },
                child: const Text('Show Loading'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Loading'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));

      final progressIndicator = tester.widget<CircularProgressIndicator>(
        find.byType(CircularProgressIndicator),
      );
      expect(progressIndicator.color, Colors.red);
      expect(progressIndicator.strokeWidth, 3.0);

      // Close the dialog
      await tester.tapAt(const Offset(10, 10));
      await tester.pump();
    });
  });
}
