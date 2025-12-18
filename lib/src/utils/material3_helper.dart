import 'package:flutter/material.dart';

/// Helper class for Material 3 support and adaptive styling
class Material3Helper {
  Material3Helper._();

  /// Gets the adaptive border radius for dialogs based on Material 3 support
  ///
  /// Returns 28.0 for Material 3, 12.0 for Material 2
  static double getAdaptiveBorderRadius(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.useMaterial3 ? 28.0 : 12.0;
  }

  /// Gets the adaptive dialog shape based on Material 3 support
  ///
  /// Returns a RoundedRectangleBorder with appropriate border radius
  static ShapeBorder getAdaptiveDialogShape(BuildContext context) {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(getAdaptiveBorderRadius(context)),
    );
  }

  /// Gets the dialog background color with Material 3 support
  ///
  /// Prioritizes DialogTheme.backgroundColor, then falls back to surface color
  static Color getDialogBackgroundColor(BuildContext context) {
    final DialogThemeData dialogTheme = DialogTheme.of(context);
    final ThemeData theme = Theme.of(context);

    // First check if explicitly set in DialogTheme
    if (dialogTheme.backgroundColor != null) {
      return dialogTheme.backgroundColor!;
    }

    // Use surface color for both Material 2 and Material 3
    // This is the recommended approach and works for both
    return theme.colorScheme.surface;
  }

  /// Gets the adaptive elevation for dialogs
  ///
  /// Material 3 typically uses lower elevation (3.0) vs Material 2 (24.0)
  static double getAdaptiveElevation(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.useMaterial3 ? 3.0 : 24.0;
  }
}
