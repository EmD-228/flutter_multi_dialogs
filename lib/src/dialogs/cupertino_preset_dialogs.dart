import 'package:flutter/cupertino.dart';
import 'cupertino_alert_dialog.dart';

/// Shows a success Cupertino alert dialog with a checkmark icon
///
/// This is a convenience function for displaying success messages with iOS styling.
///
/// Example:
/// ```dart
/// showCupertinoSuccessDialog(
///   context: context,
///   title: 'Success!',
///   message: 'Operation completed successfully.',
///   onConfirm: () => Navigator.pop(context),
/// );
/// ```
void showCupertinoSuccessDialog({
  required BuildContext context,
  String? title,
  required String message,
  String? confirmText,
  VoidCallback? onConfirm,
  Color? iconColor,
  bool barrierDismissible = true,
}) {
  showCupertinoIconAlertDialog(
    context: context,
    icon: CupertinoIcons.check_mark_circled_solid,
    iconColor: iconColor ?? CupertinoColors.systemGreen,
    iconSize: 64.0,
    title: title,
    content: message,
    barrierDismissible: barrierDismissible,
    actions: [
      CupertinoDialogAction(
        isDefaultAction: true,
        onPressed: () {
          Navigator.of(context).pop();
          onConfirm?.call();
        },
        child: Text(confirmText ?? 'OK'),
      ),
    ],
  );
}

/// Shows an error Cupertino alert dialog with an error icon
///
/// This is a convenience function for displaying error messages with iOS styling.
///
/// Example:
/// ```dart
/// showCupertinoErrorDialog(
///   context: context,
///   title: 'Error',
///   message: 'An error occurred while processing your request.',
///   onConfirm: () => Navigator.pop(context),
/// );
/// ```
void showCupertinoErrorDialog({
  required BuildContext context,
  String? title,
  required String message,
  String? error,
  String? confirmText,
  VoidCallback? onConfirm,
  Color? iconColor,
  bool barrierDismissible = true,
}) {
  final String fullMessage = error != null ? '$message\n\n$error' : message;

  showCupertinoIconAlertDialog(
    context: context,
    icon: CupertinoIcons.exclamationmark_circle_fill,
    iconColor: iconColor ?? CupertinoColors.systemRed,
    iconSize: 64.0,
    title: title,
    content: fullMessage,
    barrierDismissible: barrierDismissible,
    actions: [
      CupertinoDialogAction(
        isDefaultAction: true,
        onPressed: () {
          Navigator.of(context).pop();
          onConfirm?.call();
        },
        child: Text(confirmText ?? 'OK'),
      ),
    ],
  );
}

/// Shows a warning Cupertino alert dialog with a warning icon
///
/// This is a convenience function for displaying warning messages with iOS styling.
///
/// Example:
/// ```dart
/// showCupertinoWarningDialog(
///   context: context,
///   title: 'Warning',
///   message: 'Are you sure you want to continue?',
///   confirmText: 'Continue',
///   cancelText: 'Cancel',
///   onConfirm: () {
///     Navigator.pop(context);
///     // Proceed with action
///   },
///   onCancel: () => Navigator.pop(context),
/// );
/// ```
void showCupertinoWarningDialog({
  required BuildContext context,
  String? title,
  required String message,
  String? confirmText,
  String? cancelText,
  VoidCallback? onConfirm,
  VoidCallback? onCancel,
  Color? iconColor,
  bool barrierDismissible = true,
}) {
  showCupertinoIconAlertDialog(
    context: context,
    icon: CupertinoIcons.exclamationmark_triangle_fill,
    iconColor: iconColor ?? CupertinoColors.systemOrange,
    iconSize: 64.0,
    title: title,
    content: message,
    barrierDismissible: barrierDismissible,
    actions: [
      if (cancelText != null)
        CupertinoDialogAction(
          onPressed: () {
            Navigator.of(context).pop();
            onCancel?.call();
          },
          child: Text(cancelText),
        ),
      CupertinoDialogAction(
        isDefaultAction: true,
        isDestructiveAction: true,
        onPressed: () {
          Navigator.of(context).pop();
          onConfirm?.call();
        },
        child: Text(confirmText ?? 'Continue'),
      ),
    ],
  );
}

/// Shows an information Cupertino alert dialog with an info icon
///
/// This is a convenience function for displaying informational messages with iOS styling.
///
/// Example:
/// ```dart
/// showCupertinoInfoDialog(
///   context: context,
///   title: 'Information',
///   message: 'This is an informational message.',
///   onConfirm: () => Navigator.pop(context),
/// );
/// ```
void showCupertinoInfoDialog({
  required BuildContext context,
  String? title,
  required String message,
  String? confirmText,
  VoidCallback? onConfirm,
  Color? iconColor,
  bool barrierDismissible = true,
}) {
  showCupertinoIconAlertDialog(
    context: context,
    icon: CupertinoIcons.info_circle_fill,
    iconColor: iconColor ?? CupertinoColors.systemBlue,
    iconSize: 64.0,
    title: title,
    content: message,
    barrierDismissible: barrierDismissible,
    actions: [
      CupertinoDialogAction(
        isDefaultAction: true,
        onPressed: () {
          Navigator.of(context).pop();
          onConfirm?.call();
        },
        child: Text(confirmText ?? 'OK'),
      ),
    ],
  );
}

