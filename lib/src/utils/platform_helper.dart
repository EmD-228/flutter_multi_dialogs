import 'dart:io' show Platform;
import 'package:flutter/foundation.dart';

/// Helper class for platform detection
class PlatformHelper {
  PlatformHelper._();

  /// Checks if the current platform is iOS
  ///
  /// Returns true if running on iOS, false otherwise.
  /// In web or other platforms, returns false.
  static bool get isIOS {
    if (kIsWeb) return false;
    try {
      return Platform.isIOS;
    } catch (e) {
      return false;
    }
  }

  /// Checks if the current platform is Android
  ///
  /// Returns true if running on Android, false otherwise.
  /// In web or other platforms, returns false.
  static bool get isAndroid {
    if (kIsWeb) return false;
    try {
      return Platform.isAndroid;
    } catch (e) {
      return false;
    }
  }

  /// Checks if the current platform is mobile (iOS or Android)
  ///
  /// Returns true if running on iOS or Android, false otherwise.
  static bool get isMobile => isIOS || isAndroid;

  /// Checks if running on web
  static bool get isWeb => kIsWeb;
}
