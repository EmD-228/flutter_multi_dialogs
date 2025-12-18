import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_multi_dialogs/flutter_multi_dialogs.dart';

void main() {
  group('showCupertinoLoadingDialog', () {
    testWidgets('should display loading dialog with vertical orientation',
        (tester) async {
      await tester.pumpWidget(
        const CupertinoApp(
          home: TestWidget(),
        ),
      );

      await tester.tap(find.text('Show Loading'));
      await tester.pump();

      expect(find.byType(CupertinoActivityIndicator), findsOneWidget);
      expect(find.text('Loading...'), findsOneWidget);
    });

    testWidgets('should display loading dialog with horizontal orientation',
        (tester) async {
      await tester.pumpWidget(
        const CupertinoApp(
          home: TestWidgetHorizontal(),
        ),
      );

      await tester.tap(find.text('Show Loading'));
      await tester.pump();

      expect(find.byType(CupertinoActivityIndicator), findsOneWidget);
      expect(find.text('Loading...'), findsOneWidget);
    });

    testWidgets('should display loading dialog without message',
        (tester) async {
      await tester.pumpWidget(
        const CupertinoApp(
          home: TestWidgetNoMessage(),
        ),
      );

      await tester.tap(find.text('Show Loading'));
      await tester.pump();

      expect(find.byType(CupertinoActivityIndicator), findsOneWidget);
      expect(find.text('Loading...'), findsNothing);
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
            showCupertinoLoadingDialog(
              context: context,
              direction: const Direction(
                message: 'Loading...',
                orientations: Orientations.vertical,
              ),
            );
          },
          child: const Text('Show Loading'),
        ),
      ),
    );
  }
}

class TestWidgetHorizontal extends StatelessWidget {
  const TestWidgetHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: CupertinoButton(
          onPressed: () {
            showCupertinoLoadingDialog(
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
  }
}

class TestWidgetNoMessage extends StatelessWidget {
  const TestWidgetNoMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: CupertinoButton(
          onPressed: () {
            showCupertinoLoadingDialog(
              context: context,
              direction: const Direction(
                orientations: Orientations.vertical,
              ),
            );
          },
          child: const Text('Show Loading'),
        ),
      ),
    );
  }
}
