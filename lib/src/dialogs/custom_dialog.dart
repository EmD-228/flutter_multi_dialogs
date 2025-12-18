import 'package:flutter/material.dart';
import '../builders/simple_builder.dart';
import '../utils/material3_helper.dart';

/// Shows a custom simple dialog
///
/// Example:
/// ```dart
/// showCustomSimpleDialog(
///   context: context,
///   simpleBuilder: const SimpleBuilder(),
///   children: [const Text('Custom Dialog')],
/// );
/// ```
void showCustomSimpleDialog({
  required BuildContext context,
  bool barrierDismissible = true,
  required SimpleBuilder simpleBuilder,
  required List<Widget> children,
}) {
  showDialog<void>(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (BuildContext context) {
      return CustomSimpleDialog(
        simpleBuilder: simpleBuilder,
        children: children,
      );
    },
  );
}

/// Shows a fully customizable dialog with gravity control
///
/// The [gravity] parameter controls the vertical position from -1 (top) to 1 (bottom),
/// with 0 being the center.
///
/// Example:
/// ```dart
/// showCustomDialog(
///   context: context,
///   gravity: 0, // Center
///   child: const Text('Custom Dialog'),
/// );
/// ```
void showCustomDialog({
  Key? key,
  required BuildContext context,
  bool barrierDismissible = true,
  double gravity = 0,
  Color? backgroundColor,
  double? elevation,
  Duration insetAnimationDuration = const Duration(milliseconds: 100),
  Curve insetAnimationCurve = Curves.decelerate,
  ShapeBorder? shape,
  Widget? child,
  RouteSettings? routeSettings,
  Duration transitionDuration = const Duration(milliseconds: 200),
  Curve transitionCurve = Curves.easeOut,
}) {
  showGeneralDialog(
    context: context,
    barrierDismissible: barrierDismissible,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
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
      return CustomDialog(
        key: key,
        gravity: gravity,
        backgroundColor: backgroundColor,
        elevation: elevation,
        insetAnimationDuration: insetAnimationDuration,
        insetAnimationCurve: insetAnimationCurve,
        shape: shape,
        child: child,
      );
    },
    routeSettings: routeSettings,
  );
}

/// A customizable dialog widget
class CustomDialog extends StatelessWidget {
  /// Creates a [CustomDialog]
  ///
  /// Typically used in conjunction with [showDialog].
  const CustomDialog({
    super.key,
    this.gravity = 0,
    this.backgroundColor,
    this.elevation,
    this.insetAnimationDuration = const Duration(milliseconds: 100),
    this.insetAnimationCurve = Curves.decelerate,
    this.shape,
    this.child,
  });

  final Color? backgroundColor;
  final double? elevation;
  final Duration insetAnimationDuration;
  final Curve insetAnimationCurve;
  final ShapeBorder? shape;
  final Widget? child;

  /// Vertical position from -1 (top) to 1 (bottom), with 0 being center
  final double gravity;

  @override
  Widget build(BuildContext context) {
    final DialogThemeData dialogTheme = DialogTheme.of(context);
    if (gravity < -1 || gravity > 1) {
      throw const FormatException(
          "Gravity must be greater than negative -1 and less than 1, or it won't show up on the page");
    }

    // Get adaptive values for Material 3 support
    final ShapeBorder adaptiveShape = shape ??
        dialogTheme.shape ??
        Material3Helper.getAdaptiveDialogShape(context);
    final Color adaptiveBackgroundColor =
        backgroundColor ?? Material3Helper.getDialogBackgroundColor(context);
    final double adaptiveElevation = elevation ??
        dialogTheme.elevation ??
        Material3Helper.getAdaptiveElevation(context);

    return AnimatedPadding(
      padding: MediaQuery.of(context).viewInsets +
          const EdgeInsets.symmetric(horizontal: 40.0, vertical: 0.0),
      duration: insetAnimationDuration,
      curve: insetAnimationCurve,
      child: MediaQuery.removeViewInsets(
        removeLeft: true,
        removeTop: true,
        removeRight: true,
        removeBottom: true,
        context: context,
        child: Center(
          child: Container(
            alignment: Alignment(0, gravity),
            child: ConstrainedBox(
              constraints: const BoxConstraints(minWidth: 280.0),
              child: Material(
                color: adaptiveBackgroundColor,
                elevation: adaptiveElevation,
                shape: adaptiveShape,
                type: MaterialType.card,
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// A custom simple dialog widget
class CustomSimpleDialog extends StatelessWidget {
  /// Creates a [CustomSimpleDialog]
  const CustomSimpleDialog({
    super.key,
    required this.simpleBuilder,
    required this.children,
  });

  final SimpleBuilder simpleBuilder;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterialLocalizations(context));
    return SimpleDialog(
      title: simpleBuilder.title,
      titlePadding: simpleBuilder.titlePadding,
      contentPadding: simpleBuilder.contentPadding,
      backgroundColor: simpleBuilder.backgroundColor,
      elevation: simpleBuilder.elevation,
      semanticLabel: simpleBuilder.semanticLabel,
      shape: simpleBuilder.shape,
      children: children,
    );
  }
}
