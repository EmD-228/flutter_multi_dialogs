import 'package:flutter/material.dart';
import 'alert_dialog.dart';

/// Shows a success dialog with a check circle icon
///
/// This is a convenience function for displaying success messages.
/// It automatically uses a green check circle icon and appropriate styling.
///
/// Example:
/// ```dart
/// showSuccessDialog(
///   context: context,
///   title: 'Success!',
///   message: 'Operation completed successfully.',
///   onConfirm: () => Navigator.pop(context),
/// );
/// ```
void showSuccessDialog({
  required BuildContext context,
  String? title,
  required String message,
  String? confirmText,
  VoidCallback? onConfirm,
  Color? iconColor,
  Color? backgroundColor,
  bool barrierDismissible = true,
  RouteSettings? routeSettings,
}) {
  showIconAlertDialog(
    context: context,
    icon: Icons.check_circle,
    iconColor: iconColor ?? Colors.green,
    iconSize: 64.0,
    title: title != null ? Text(title) : null,
    content: Text(message),
    backgroundColor: backgroundColor,
    barrierDismissible: barrierDismissible,
    semanticLabel: 'Success Dialog',
    actions: [
      TextButton(
        onPressed: () {
          Navigator.of(context).pop();
          onConfirm?.call();
        },
        child: Text(confirmText ?? 'OK'),
      ),
    ],
    routeSettings: routeSettings,
  );
}

/// Shows an error dialog with an error icon
///
/// This is a convenience function for displaying error messages.
/// It automatically uses a red error icon and appropriate styling.
///
/// Example:
/// ```dart
/// showErrorDialog(
///   context: context,
///   title: 'Error',
///   message: 'An error occurred while processing your request.',
///   onConfirm: () => Navigator.pop(context),
/// );
/// ```
void showErrorDialog({
  required BuildContext context,
  String? title,
  required String message,
  String? error,
  String? confirmText,
  VoidCallback? onConfirm,
  Color? iconColor,
  Color? backgroundColor,
  bool barrierDismissible = true,
  RouteSettings? routeSettings,
}) {
  showIconAlertDialog(
    context: context,
    icon: Icons.error,
    iconColor: iconColor ?? Colors.red,
    iconSize: 64.0,
    title: title != null ? Text(title) : null,
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(message),
        if (error != null) ...[
          const SizedBox(height: 12),
          Text(
            error,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
              fontFamily: 'monospace',
            ),
          ),
        ],
      ],
    ),
    backgroundColor: backgroundColor,
    barrierDismissible: barrierDismissible,
    semanticLabel: 'Error Dialog',
    actions: [
      TextButton(
        onPressed: () {
          Navigator.of(context).pop();
          onConfirm?.call();
        },
        child: Text(confirmText ?? 'OK'),
      ),
    ],
    routeSettings: routeSettings,
  );
}

/// Shows a warning dialog with a warning icon
///
/// This is a convenience function for displaying warning messages.
/// It automatically uses an orange warning icon and appropriate styling.
///
/// Example:
/// ```dart
/// showWarningDialog(
///   context: context,
///   title: 'Warning',
///   message: 'Are you sure you want to continue?',
///   onConfirm: () {
///     Navigator.pop(context);
///     // Proceed with action
///   },
///   onCancel: () => Navigator.pop(context),
/// );
/// ```
void showWarningDialog({
  required BuildContext context,
  String? title,
  required String message,
  String? confirmText,
  String? cancelText,
  VoidCallback? onConfirm,
  VoidCallback? onCancel,
  Color? iconColor,
  Color? backgroundColor,
  bool barrierDismissible = true,
  RouteSettings? routeSettings,
}) {
  showIconAlertDialog(
    context: context,
    icon: Icons.warning,
    iconColor: iconColor ?? Colors.orange,
    iconSize: 64.0,
    title: title != null ? Text(title) : null,
    content: Text(message),
    backgroundColor: backgroundColor,
    barrierDismissible: barrierDismissible,
    semanticLabel: 'Warning Dialog',
    actions: [
      if (cancelText != null)
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            onCancel?.call();
          },
          child: Text(cancelText),
        ),
      TextButton(
        onPressed: () {
          Navigator.of(context).pop();
          onConfirm?.call();
        },
        child: Text(confirmText ?? 'OK'),
      ),
    ],
    routeSettings: routeSettings,
  );
}

/// Shows an info dialog with an info icon
///
/// This is a convenience function for displaying informational messages.
/// It automatically uses a blue info icon and appropriate styling.
///
/// Example:
/// ```dart
/// showInfoDialog(
///   context: context,
///   title: 'Information',
///   message: 'This is an informational message.',
///   onConfirm: () => Navigator.pop(context),
/// );
/// ```
void showInfoDialog({
  required BuildContext context,
  String? title,
  required String message,
  String? confirmText,
  VoidCallback? onConfirm,
  Color? iconColor,
  Color? backgroundColor,
  bool barrierDismissible = true,
  RouteSettings? routeSettings,
}) {
  showIconAlertDialog(
    context: context,
    icon: Icons.info,
    iconColor: iconColor ?? Colors.blue,
    iconSize: 64.0,
    title: title != null ? Text(title) : null,
    content: Text(message),
    backgroundColor: backgroundColor,
    barrierDismissible: barrierDismissible,
    semanticLabel: 'Info Dialog',
    actions: [
      TextButton(
        onPressed: () {
          Navigator.of(context).pop();
          onConfirm?.call();
        },
        child: Text(confirmText ?? 'OK'),
      ),
    ],
    routeSettings: routeSettings,
  );
}
