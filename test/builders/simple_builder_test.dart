import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_multi_dialogs/flutter_multi_dialogs.dart';

void main() {
  group('SimpleBuilder', () {
    test('should create SimpleBuilder with default values', () {
      const builder = SimpleBuilder();

      expect(builder.title, isNull);
      expect(builder.content, isNull);
      expect(builder.backgroundColor, isNull);
      expect(builder.elevation, isNull);
      expect(builder.semanticLabel, isNull);
      expect(builder.shape, isNull);
      expect(builder.titlePadding, isA<EdgeInsetsGeometry>());
      expect(builder.contentPadding, isA<EdgeInsetsGeometry>());
    });

    test('should create SimpleBuilder with all parameters', () {
      const title = Text('Title');
      const content = Text('Content');
      const shape = RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      );

      const builder = SimpleBuilder(
        title: title,
        content: content,
        backgroundColor: Colors.blue,
        elevation: 8.0,
        semanticLabel: 'Test Dialog',
        shape: shape,
        titlePadding: EdgeInsets.all(16),
        contentPadding: EdgeInsets.all(20),
      );

      expect(builder.title, title);
      expect(builder.content, content);
      expect(builder.backgroundColor, Colors.blue);
      expect(builder.elevation, 8.0);
      expect(builder.semanticLabel, 'Test Dialog');
      expect(builder.shape, shape);
    });

    test('should use default padding values', () {
      const builder = SimpleBuilder();

      expect(
        builder.titlePadding,
        const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),
      );
      expect(
        builder.contentPadding,
        const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 24.0),
      );
    });
  });
}

