import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_multi_dialogs/flutter_multi_dialogs.dart';

void main() {
  group('DialogBuilder', () {
    test('should create DialogBuilder with required SimpleBuilder', () {
      const simpleBuilder = SimpleBuilder();
      const dialogBuilder = DialogBuilder(simpleBuilder: simpleBuilder);

      expect(dialogBuilder.simpleBuilder, simpleBuilder);
      expect(dialogBuilder.titleTextStyle, isNull);
      expect(dialogBuilder.contentTextStyle, isNull);
      expect(dialogBuilder.actions, isNull);
    });

    test('should create DialogBuilder with all parameters', () {
      const simpleBuilder = SimpleBuilder(title: Text('Title'));
      const titleStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
      const contentStyle = TextStyle(fontSize: 16);
      final actions = [
        const TextButton(onPressed: null, child: Text('OK')),
      ];

      final dialogBuilder = DialogBuilder(
        simpleBuilder: simpleBuilder,
        titleTextStyle: titleStyle,
        contentTextStyle: contentStyle,
        actions: actions,
      );

      expect(dialogBuilder.simpleBuilder, simpleBuilder);
      expect(dialogBuilder.titleTextStyle, titleStyle);
      expect(dialogBuilder.contentTextStyle, contentStyle);
      expect(dialogBuilder.actions, actions);
    });
  });
}

