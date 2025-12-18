import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_multi_dialogs/flutter_multi_dialogs.dart';

void main() {
  group('Direction', () {
    test('should create Direction with all parameters', () {
      const direction = Direction(
        message: 'Loading...',
        messageStyle: TextStyle(fontSize: 16),
        orientations: Orientations.horizontal,
        width: 120.0,
        height: 60.0,
        mainAxisAlignment: MainAxisAlignment.center,
      );

      expect(direction.message, 'Loading...');
      expect(direction.orientations, Orientations.horizontal);
      expect(direction.width, 120.0);
      expect(direction.height, 60.0);
      expect(direction.mainAxisAlignment, MainAxisAlignment.center);
    });

    test('should create Direction with minimal parameters', () {
      const direction = Direction();

      expect(direction.message, isNull);
      expect(direction.orientations, isNull);
      expect(direction.width, isNull);
      expect(direction.height, isNull);
    });

    test('should create Direction with vertical orientation', () {
      const direction = Direction(
        orientations: Orientations.vertical,
        message: 'Processing',
      );

      expect(direction.orientations, Orientations.vertical);
      expect(direction.message, 'Processing');
    });
  });
}

