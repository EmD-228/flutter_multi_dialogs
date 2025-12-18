import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_multi_dialogs/flutter_multi_dialogs.dart';

void main() {
  group('showCupertinoActionSheet', () {
    testWidgets('should display Cupertino action sheet with title and message', (tester) async {
      await tester.pumpWidget(
        const CupertinoApp(
          home: TestWidget(),
        ),
      );

      await tester.tap(find.text('Show Action Sheet'));
      await tester.pumpAndSettle();

      expect(find.text('Test Title'), findsOneWidget);
      expect(find.text('Test Message'), findsOneWidget);
      expect(find.text('Cancel'), findsOneWidget);
    });

    testWidgets('should display action sheet with custom actions', (tester) async {
      await tester.pumpWidget(
        const CupertinoApp(
          home: TestWidgetWithActions(),
        ),
      );

      await tester.tap(find.text('Show Action Sheet'));
      await tester.pumpAndSettle();

      expect(find.text('Option 1'), findsOneWidget);
      expect(find.text('Option 2'), findsOneWidget);
    });

    testWidgets('should dismiss when cancel is tapped', (tester) async {
      await tester.pumpWidget(
        const CupertinoApp(
          home: TestWidget(),
        ),
      );

      await tester.tap(find.text('Show Action Sheet'));
      await tester.pumpAndSettle();

      expect(find.text('Test Title'), findsOneWidget);

      await tester.tap(find.text('Cancel'));
      await tester.pumpAndSettle();

      expect(find.text('Test Title'), findsNothing);
    });
  });

  group('showCupertinoListActionSheet', () {
    testWidgets('should display list action sheet with items', (tester) async {
      await tester.pumpWidget(
        const CupertinoApp(
          home: TestListWidget(),
        ),
      );

      await tester.tap(find.text('Show List'));
      await tester.pumpAndSettle();

      expect(find.text('Item 1'), findsOneWidget);
      expect(find.text('Item 2'), findsOneWidget);
      expect(find.text('Item 3'), findsOneWidget);
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
            showCupertinoActionSheet(
              context: context,
              title: 'Test Title',
              message: 'Test Message',
            );
          },
          child: const Text('Show Action Sheet'),
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
            showCupertinoActionSheet(
              context: context,
              title: 'Test Title',
              actions: [
                CupertinoActionSheetAction(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Option 1'),
                ),
                CupertinoActionSheetAction(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Option 2'),
                ),
              ],
            );
          },
          child: const Text('Show Action Sheet'),
        ),
      ),
    );
  }
}

class TestListWidget extends StatelessWidget {
  const TestListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: CupertinoButton(
          onPressed: () {
            showCupertinoListActionSheet(
              context: context,
              title: 'Select an item',
              items: const ['Item 1', 'Item 2', 'Item 3'],
              onItemSelected: (index) {
                // Handle selection
              },
            );
          },
          child: const Text('Show List'),
        ),
      ),
    );
  }
}

