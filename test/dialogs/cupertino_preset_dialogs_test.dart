import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_multi_dialogs/flutter_multi_dialogs.dart';

void main() {
  group('Cupertino Preset Dialogs', () {
    testWidgets('showCupertinoSuccessDialog should display success dialog',
        (tester) async {
      await tester.pumpWidget(
        const CupertinoApp(
          home: TestSuccessWidget(),
        ),
      );

      await tester.tap(find.text('Show Success'));
      await tester.pumpAndSettle();

      expect(
          find.byIcon(CupertinoIcons.check_mark_circled_solid), findsOneWidget);
      expect(find.text('Success!'), findsOneWidget);
      expect(find.text('Operation completed.'), findsOneWidget);
    });

    testWidgets('showCupertinoErrorDialog should display error dialog',
        (tester) async {
      await tester.pumpWidget(
        const CupertinoApp(
          home: TestErrorWidget(),
        ),
      );

      await tester.tap(find.text('Show Error'));
      await tester.pumpAndSettle();

      expect(find.byIcon(CupertinoIcons.exclamationmark_circle_fill),
          findsOneWidget);
      expect(find.text('Error!'), findsOneWidget);
    });

    testWidgets('showCupertinoWarningDialog should display warning dialog',
        (tester) async {
      await tester.pumpWidget(
        const CupertinoApp(
          home: TestWarningWidget(),
        ),
      );

      await tester.tap(find.text('Show Warning'));
      await tester.pumpAndSettle();

      expect(find.byIcon(CupertinoIcons.exclamationmark_triangle_fill),
          findsOneWidget);
      expect(find.text('Warning!'), findsOneWidget);
      expect(find.text('Cancel'), findsOneWidget);
      expect(find.text('Continue'), findsOneWidget);
    });

    testWidgets('showCupertinoInfoDialog should display info dialog',
        (tester) async {
      await tester.pumpWidget(
        const CupertinoApp(
          home: TestInfoWidget(),
        ),
      );

      await tester.tap(find.text('Show Info'));
      await tester.pumpAndSettle();

      expect(find.byIcon(CupertinoIcons.info_circle_fill), findsOneWidget);
      expect(find.text('Information'), findsOneWidget);
    });
  });
}

class TestSuccessWidget extends StatelessWidget {
  const TestSuccessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: CupertinoButton(
          onPressed: () {
            showCupertinoSuccessDialog(
              context: context,
              title: 'Success!',
              message: 'Operation completed.',
            );
          },
          child: const Text('Show Success'),
        ),
      ),
    );
  }
}

class TestErrorWidget extends StatelessWidget {
  const TestErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: CupertinoButton(
          onPressed: () {
            showCupertinoErrorDialog(
              context: context,
              title: 'Error!',
              message: 'An error occurred.',
            );
          },
          child: const Text('Show Error'),
        ),
      ),
    );
  }
}

class TestWarningWidget extends StatelessWidget {
  const TestWarningWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: CupertinoButton(
          onPressed: () {
            showCupertinoWarningDialog(
              context: context,
              title: 'Warning!',
              message: 'Are you sure?',
              confirmText: 'Continue',
              cancelText: 'Cancel',
            );
          },
          child: const Text('Show Warning'),
        ),
      ),
    );
  }
}

class TestInfoWidget extends StatelessWidget {
  const TestInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: CupertinoButton(
          onPressed: () {
            showCupertinoInfoDialog(
              context: context,
              title: 'Information',
              message: 'This is an info message.',
            );
          },
          child: const Text('Show Info'),
        ),
      ),
    );
  }
}
