import 'package:flutter/material.dart';

/// Extended AlertDialog with additional customization options
///
/// This function extends Flutter's built-in [showDialog] with additional
/// features like custom transitions, route settings, and better accessibility.
///
/// Example:
/// ```dart
/// showAlertDialog(
///   context: context,
///   title: const Text('Confirm'),
///   content: const Text('Are you sure?'),
///   actions: [
///     TextButton(
///       onPressed: () => Navigator.pop(context),
///       child: const Text('OK'),
///     ),
///   ],
/// );
/// ```
void showAlertDialog({
  Widget? title,
  EdgeInsetsGeometry? titlePadding,
  TextStyle? titleTextStyle,
  Widget? content,
  TextStyle? contentTextStyle,
  List<Widget>? actions,
  Color? backgroundColor,
  double? elevation,
  String? semanticLabel,
  ShapeBorder? shape,
  bool barrierDismissible = true,
  required BuildContext context,
  RouteSettings? routeSettings,
  Duration transitionDuration = const Duration(milliseconds: 200),
  Curve transitionCurve = Curves.easeOut,
  Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)? transitionBuilder,
}) {
  showGeneralDialog<void>(
    context: context,
    barrierDismissible: barrierDismissible,
    barrierLabel: semanticLabel ?? MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Colors.black54,
    transitionDuration: transitionDuration,
    transitionBuilder: transitionBuilder ??
        (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: ScaleTransition(
              scale: Tween<double>(begin: 0.8, end: 1.0).animate(
                CurvedAnimation(
                  parent: animation,
                  curve: transitionCurve,
                ),
              ),
              child: child,
            ),
          );
        },
    pageBuilder: (context, animation, secondaryAnimation) {
      return AlertDialog(
        title: title,
        titlePadding: titlePadding,
        titleTextStyle: titleTextStyle,
        content: content,
        contentTextStyle: contentTextStyle,
        backgroundColor: backgroundColor,
        elevation: elevation,
        semanticLabel: semanticLabel,
        shape: shape,
        actions: actions,
      );
    },
    routeSettings: routeSettings,
  );
}

/// Shows an alert dialog with an icon at the top
///
/// This is a convenience function for displaying dialogs with icons,
/// commonly used for success, error, warning, or info messages.
///
/// Example:
/// ```dart
/// showIconAlertDialog(
///   context: context,
///   icon: Icons.check_circle,
///   iconColor: Colors.green,
///   title: const Text('Success!'),
///   content: const Text('Operation completed successfully.'),
///   actions: [
///     TextButton(
///       onPressed: () => Navigator.pop(context),
///       child: const Text('OK'),
///     ),
///   ],
/// );
/// ```
void showIconAlertDialog({
  required BuildContext context,
  Widget? title,
  Widget? content,
  IconData? icon,
  Widget? iconWidget,
  Color? iconColor,
  double iconSize = 48.0,
  List<Widget>? actions,
  Color? backgroundColor,
  double? elevation,
  ShapeBorder? shape,
  bool barrierDismissible = true,
  String? semanticLabel,
  RouteSettings? routeSettings,
  Duration transitionDuration = const Duration(milliseconds: 200),
  Curve transitionCurve = Curves.easeOut,
}) {
  showGeneralDialog<void>(
    context: context,
    barrierDismissible: barrierDismissible,
    barrierLabel: semanticLabel ?? MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Colors.black54,
    transitionDuration: transitionDuration,
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: ScaleTransition(
          scale: Tween<double>(begin: 0.8, end: 1.0).animate(
            CurvedAnimation(
              parent: animation,
              curve: transitionCurve,
            ),
          ),
          child: child,
        ),
      );
    },
    pageBuilder: (context, animation, secondaryAnimation) {
      return AlertDialog(
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
                      color: iconColor ?? Theme.of(context).colorScheme.primary,
                    ),
                  if (title != null) ...[
                    const SizedBox(height: 16),
                    title,
                  ],
                ],
              )
            : null,
        content: content,
        actions: actions,
        backgroundColor: backgroundColor,
        elevation: elevation,
        shape: shape,
        semanticLabel: semanticLabel,
      );
    },
    routeSettings: routeSettings,
  );
}

