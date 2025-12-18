import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_multi_dialogs/flutter_multi_dialogs.dart';

/// Main test file that runs all tests
void main() {
  group('Multiple Dialog Package', () {
    test('should export all public APIs', () {
      // Test that all main classes and functions are accessible
      expect(() => const Direction(), returnsNormally);
      expect(() => const SimpleBuilder(), returnsNormally);
      expect(() => const DialogBuilder(simpleBuilder: SimpleBuilder()), returnsNormally);
      expect(Orientations.vertical, isNotNull);
      expect(Orientations.horizontal, isNotNull);
    });

    testWidgets('should work with MaterialApp', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Text('Test'),
          ),
        ),
      );

      expect(find.text('Test'), findsOneWidget);
    });
  });
}
