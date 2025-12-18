import 'package:flutter_test/flutter_test.dart';
import 'package:multiple_dialog/multiple_dialog.dart';

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

