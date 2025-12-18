import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:multiple_dialog/multiple_dialog.dart';

void main() {
  group('showSimpleListDialog', () {
    testWidgets('should display list dialog with items', (WidgetTester tester) async {
      final items = ['Item 1', 'Item 2', 'Item 3'];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  showSimpleListDialog(
                    context: context,
                    simpleBuilder: const SimpleBuilder(title: Text('Choose')),
                    children: items.map((item) => Text(item)).toList(),
                    onItemCallBack: (index) {
                      debugPrint('Selected: $index');
                    },
                  );
                },
                child: const Text('Show List'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show List'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));

      expect(find.text('Choose'), findsOneWidget);
      expect(find.text('Item 1'), findsOneWidget);
      expect(find.text('Item 2'), findsOneWidget);
      expect(find.text('Item 3'), findsOneWidget);
      
      // Close dialog
      await tester.tap(find.text('Item 1'));
      await tester.pumpAndSettle();
    });

    testWidgets('should call callback when item is tapped', (WidgetTester tester) async {
      int? selectedIndex;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  showSimpleListDialog(
                    context: context,
                    simpleBuilder: const SimpleBuilder(),
                    children: const [
                      Text('Option 1'),
                      Text('Option 2'),
                    ],
                    onItemCallBack: (index) {
                      selectedIndex = index;
                    },
                  );
                },
                child: const Text('Show List'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show List'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));

      await tester.tap(find.text('Option 2'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));

      expect(selectedIndex, 1);
      expect(find.byType(SimpleDialog), findsNothing);
    });

    testWidgets('should display dividers when showDividers is true', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  showSimpleListDialog(
                    context: context,
                    simpleBuilder: const SimpleBuilder(),
                    children: const [
                      Text('Item 1'),
                      Text('Item 2'),
                    ],
                    onItemCallBack: (_) {},
                    showDividers: true,
                  );
                },
                child: const Text('Show List'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show List'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));

      expect(find.byType(Divider), findsWidgets);
      
      // Close dialog
      await tester.tap(find.text('Item 1'));
      await tester.pumpAndSettle();
    });
  });
}

