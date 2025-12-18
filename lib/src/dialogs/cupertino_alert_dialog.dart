import 'package:flutter/cupertino.dart';

/// Shows a Cupertino alert dialog with customizable options
///
/// This function provides an iOS-style alert dialog with a native look and feel.
///
/// Example:
/// ```dart
/// showCupertinoAlertDialog(
///   context: context,
///   title: 'Confirm',
///   content: 'Are you sure you want to proceed?',
///   actions: [
///     CupertinoDialogAction(
///       onPressed: () => Navigator.pop(context),
///       child: const Text('Cancel'),
///     ),
///     CupertinoDialogAction(
///       isDefaultAction: true,
///       onPressed: () => Navigator.pop(context),
///       child: const Text('OK'),
///     ),
///   ],
/// );
/// ```
void showCupertinoAlertDialog({
  required BuildContext context,
  String? title,
  String? content,
  List<CupertinoDialogAction>? actions,
  bool barrierDismissible = true,
}) {
  showCupertinoDialog<void>(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        title: title != null ? Text(title) : null,
        content: content != null ? Text(content) : null,
        actions: actions ??
            [
              CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ],
      );
    },
  );
}

/// Shows a Cupertino alert dialog with an icon
///
/// This is a convenience function for displaying dialogs with icons,
/// commonly used for success, error, warning, or info messages.
///
/// Example:
/// ```dart
/// showCupertinoIconAlertDialog(
///   context: context,
///   icon: CupertinoIcons.check_mark_circled_solid,
///   iconColor: CupertinoColors.systemGreen,
///   title: 'Success!',
///   content: 'Operation completed successfully.',
///   actions: [
///     CupertinoDialogAction(
///       onPressed: () => Navigator.pop(context),
///       child: const Text('OK'),
///     ),
///   ],
/// );
/// ```
void showCupertinoIconAlertDialog({
  required BuildContext context,
  String? title,
  String? content,
  IconData? icon,
  Widget? iconWidget,
  Color? iconColor,
  double iconSize = 48.0,
  List<CupertinoDialogAction>? actions,
  bool barrierDismissible = true,
}) {
  showCupertinoDialog<void>(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        title: title != null || icon != null || iconWidget != null
            ? Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (iconWidget != null)
                    iconWidget
                  else if (icon != null)
                    Icon(
                      icon,
                      size: iconSize,
                      color: iconColor ?? CupertinoColors.activeBlue,
                    ),
                  if (title != null) ...[
                    const SizedBox(height: 16),
                    Text(title),
                  ],
                ],
              )
            : null,
        content: content != null ? Text(content) : null,
        actions: actions ??
            [
              CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ],
      );
    },
  );
}
