import 'package:flutter/material.dart';
import '../builders/dialog_builder.dart';

/// Shows a custom alert dialog with builder pattern
///
/// Example:
/// ```dart
/// showCustomAlertDialog(
///   context: context,
///   dialogBuilder: DialogBuilder(
///     simpleBuilder: SimpleBuilder(
///       title: const Text('Title'),
///       content: const Text('Content'),
///     ),
///   ),
///   confirmWidget: const Text('Confirm'),
///   cancelWidget: const Text('Cancel'),
///   onConfirmCallBack: () => Navigator.pop(context),
/// );
/// ```
void showCustomAlertDialog({
  required BuildContext context,
  bool barrierDismissible = true,
  required DialogBuilder dialogBuilder,
  Widget? confirmWidget,
  Widget? cancelWidget,
  VoidCallback? onConfirmCallBack,
  VoidCallback? onCancelCallBack,
  RouteSettings? routeSettings,
  Duration transitionDuration = const Duration(milliseconds: 200),
  Curve transitionCurve = Curves.easeOut,
  bool autoCloseOnAction = true,
}) {
  showGeneralDialog<void>(
    context: context,
    barrierDismissible: barrierDismissible,
    barrierLabel: dialogBuilder.simpleBuilder.semanticLabel ?? 
        MaterialLocalizations.of(context).modalBarrierDismissLabel,
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
      return CustomAlertDialog(
        dialogBuilder: dialogBuilder,
        confirmWidget: confirmWidget,
        cancelWidget: cancelWidget,
        onConfirmCallBack: autoCloseOnAction
            ? () {
                Navigator.of(context).pop();
                onConfirmCallBack?.call();
              }
            : onConfirmCallBack,
        onCancelCallBack: autoCloseOnAction
            ? () {
                Navigator.of(context).pop();
                onCancelCallBack?.call();
              }
            : onCancelCallBack,
      );
    },
    routeSettings: routeSettings,
  );
}

/// A custom alert dialog widget with builder pattern
class CustomAlertDialog extends StatelessWidget {
  /// Creates a [CustomAlertDialog]
  const CustomAlertDialog({
    super.key,
    this.confirmWidget,
    this.cancelWidget,
    required this.dialogBuilder,
    this.onConfirmCallBack,
    this.onCancelCallBack,
  });

  final DialogBuilder dialogBuilder;
  final Widget? confirmWidget;
  final Widget? cancelWidget;
  final VoidCallback? onConfirmCallBack;
  final VoidCallback? onCancelCallBack;

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterialLocalizations(context));

    return AlertDialog(
      title: dialogBuilder.simpleBuilder.title,
      titlePadding: dialogBuilder.simpleBuilder.titlePadding,
      titleTextStyle: dialogBuilder.titleTextStyle,
      content: SingleChildScrollView(
        child: dialogBuilder.simpleBuilder.content,
      ),
      contentPadding: dialogBuilder.simpleBuilder.contentPadding,
      contentTextStyle: dialogBuilder.contentTextStyle,
      backgroundColor: dialogBuilder.simpleBuilder.backgroundColor,
      elevation: dialogBuilder.simpleBuilder.elevation,
      semanticLabel: dialogBuilder.simpleBuilder.semanticLabel,
      shape: dialogBuilder.simpleBuilder.shape,
      actions: <Widget>[
        if (confirmWidget != null)
          TextButton(
            onPressed: onConfirmCallBack,
            child: confirmWidget!,
          ),
        if (cancelWidget != null)
          TextButton(
            onPressed: onCancelCallBack,
            child: cancelWidget!,
          ),
      ],
    );
  }
}

