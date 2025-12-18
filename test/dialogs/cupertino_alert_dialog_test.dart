import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_multi_dialogs/flutter_multi_dialogs.dart';

void main() {
  group('showCupertinoAlertDialog', () {
    testWidgets('should display Cupertino alert dialog with title and content', (tester) async {
      await tester.pumpWidget(
        const CupertinoApp(
          home: TestWidget(),
        ),
      );

      // Find and tap the button to show dialog
      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();

      // Verify dialog is displayed
      expect(find.text('Test Title'), findsOneWidget);
      expect(find.text('Test Content'), findsOneWidget);
      expect(find.text('OK'), findsOneWidget);
    });

    testWidgets('should display Cupertino alert dialog with custom actions', (tester) async {
      await tester.pumpWidget(
        const CupertinoApp(
          home: TestWidgetWithActions(),
        ),
      );

      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();

      expect(find.text('Test Title'), findsOneWidget);
      expect(find.text('Cancel'), findsOneWidget);
      expect(find.text('Confirm'), findsOneWidget);
    });

    testWidgets('should dismiss dialog when OK is tapped', (tester) async {
      await tester.pumpWidget(
        const CupertinoApp(
          home: TestWidget(),
        ),
      );

      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();

      expect(find.text('Test Title'), findsOneWidget);

      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();

      expect(find.text('Test Title'), findsNothing);
    });
  });

  group('showCupertinoIconAlertDialog', () {
    testWidgets('should display Cupertino alert dialog with icon', (tester) async {
      await tester.pumpWidget(
        const CupertinoApp(
          home: TestWidgetWithIcon(),
        ),
      );

      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();

      expect(find.byIcon(CupertinoIcons.info), findsOneWidget);
      expect(find.text('Test Title'), findsOneWidget);
    });
  });
}

class TestWidget extends StatelessWidget {
  const TestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: CupertinoButton(
          onPressed: () {
            showCupertinoAlertDialog(
              context: context,
              title: 'Test Title',
              content: 'Test Content',
            );
          },
          child: const Text('Show Dialog'),
        ),
      ),
    );
  }
}

class TestWidgetWithActions extends StatelessWidget {
  const TestWidgetWithActions({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: CupertinoButton(
          onPressed: () {
            showCupertinoAlertDialog(
              context: context,
              title: 'Test Title',
              content: 'Test Content',
              actions: [
                CupertinoDialogAction(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                CupertinoDialogAction(
                  isDefaultAction: true,
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Confirm'),
                ),
              ],
            );
          },
          child: const Text('Show Dialog'),
        ),
      ),
    );
  }
}

class TestWidgetWithIcon extends StatelessWidget {
  const TestWidgetWithIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: CupertinoButton(
          onPressed: () {
            showCupertinoIconAlertDialog(
              context: context,
              icon: CupertinoIcons.info,
              title: 'Test Title',
              content: 'Test Content',
            );
          },
          child: const Text('Show Dialog'),
        ),
      ),
    );
  }
}

