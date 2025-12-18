import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_multi_dialogs/src/utils/material3_helper.dart';

void main() {
  group('Material3Helper', () {
    testWidgets('should return 28.0 border radius for Material 3',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(useMaterial3: true),
          home: Builder(
            builder: (context) {
              final radius = Material3Helper.getAdaptiveBorderRadius(context);
              expect(radius, equals(28.0));
              return const SizedBox();
            },
          ),
        ),
      );
    });

    testWidgets('should return 12.0 border radius for Material 2',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(useMaterial3: false),
          home: Builder(
            builder: (context) {
              final radius = Material3Helper.getAdaptiveBorderRadius(context);
              expect(radius, equals(12.0));
              return const SizedBox();
            },
          ),
        ),
      );
    });

    testWidgets('should return adaptive dialog shape for Material 3',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(useMaterial3: true),
          home: Builder(
            builder: (context) {
              final shape = Material3Helper.getAdaptiveDialogShape(context);
              expect(shape, isA<RoundedRectangleBorder>());
              final roundedShape = shape as RoundedRectangleBorder;
              expect(roundedShape.borderRadius, isA<BorderRadius>());
              return const SizedBox();
            },
          ),
        ),
      );
    });

    testWidgets('should return adaptive dialog shape for Material 2',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(useMaterial3: false),
          home: Builder(
            builder: (context) {
              final shape = Material3Helper.getAdaptiveDialogShape(context);
              expect(shape, isA<RoundedRectangleBorder>());
              return const SizedBox();
            },
          ),
        ),
      );
    });

    testWidgets('should return dialog background color from DialogTheme',
        (tester) async {
      const testColor = Colors.red;
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(
            useMaterial3: true,
            dialogTheme: const DialogThemeData(backgroundColor: testColor),
          ),
          home: Builder(
            builder: (context) {
              final color = Material3Helper.getDialogBackgroundColor(context);
              expect(color, equals(testColor));
              return const SizedBox();
            },
          ),
        ),
      );
    });

    testWidgets(
        'should return surface color when DialogTheme backgroundColor is null',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          ),
          home: Builder(
            builder: (context) {
              final color = Material3Helper.getDialogBackgroundColor(context);
              expect(color, isA<Color>());
              return const SizedBox();
            },
          ),
        ),
      );
    });

    testWidgets('should return 3.0 elevation for Material 3', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(useMaterial3: true),
          home: Builder(
            builder: (context) {
              final elevation = Material3Helper.getAdaptiveElevation(context);
              expect(elevation, equals(3.0));
              return const SizedBox();
            },
          ),
        ),
      );
    });

    testWidgets('should return 24.0 elevation for Material 2', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(useMaterial3: false),
          home: Builder(
            builder: (context) {
              final elevation = Material3Helper.getAdaptiveElevation(context);
              expect(elevation, equals(24.0));
              return const SizedBox();
            },
          ),
        ),
      );
    });
  });
}
