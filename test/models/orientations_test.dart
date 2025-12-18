import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_multi_dialogs/flutter_multi_dialogs.dart';

void main() {
  group('Orientations', () {
    test('should have Vertical and Horizontal values', () {
      expect(Orientations.Vertical, isNotNull);
      expect(Orientations.Horizontal, isNotNull);
    });

    test('should be enum values', () {
      expect(Orientations.values.length, 2);
      expect(Orientations.values, contains(Orientations.Vertical));
      expect(Orientations.values, contains(Orientations.Horizontal));
    });
  });
}

