import 'package:flutter/material.dart';
import '../models/direction.dart';
import '../models/orientations.dart';

/// Shows a loading dialog with customizable orientation and message
///
/// Example:
/// ```dart
/// showLoadingDialog(
///   context: context,
///   direction: const Direction(
///     message: "Loading...",
///     orientations: Orientations.Horizontal,
///   ),
/// );
/// ```
void showLoadingDialog({
  required BuildContext context,
  Color? backgroundColor,
  double? elevation,
  EdgeInsetsGeometry? contentPadding,
  ShapeBorder? shape,
  required Direction direction,
  bool barrierDismissible = false,
  Duration insetAnimationDuration = const Duration(milliseconds: 100),
  Curve insetAnimationCurve = Curves.decelerate,
  Color? progressIndicatorColor,
  double? progressIndicatorStrokeWidth,
  RouteSettings? routeSettings,
  Duration transitionDuration = const Duration(milliseconds: 150),
  Curve transitionCurve = Curves.easeOut,
}) {
  showGeneralDialog<void>(
    context: context,
    barrierDismissible: barrierDismissible,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Colors.black38,
    transitionDuration: transitionDuration,
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
    pageBuilder: (context, animation, secondaryAnimation) {
      return LoadingDialog(
        direction: direction,
        elevation: elevation,
        backgroundColor: backgroundColor,
        shape: shape,
        contentPadding: contentPadding,
        insetAnimationDuration: insetAnimationDuration,
        insetAnimationCurve: insetAnimationCurve,
        progressIndicatorColor: progressIndicatorColor,
        progressIndicatorStrokeWidth: progressIndicatorStrokeWidth,
      );
    },
    routeSettings: routeSettings,
  );
}

/// Loading dialog widget with customizable orientation and message
class LoadingDialog extends Dialog {
  /// Creates a [LoadingDialog]
  const LoadingDialog({
    super.key,
    this.contentPadding,
    this.backgroundColor,
    this.elevation,
    this.shape,
    required this.direction,
    this.insetAnimationDuration = const Duration(milliseconds: 100),
    this.insetAnimationCurve = Curves.decelerate,
    this.progressIndicatorColor,
    this.progressIndicatorStrokeWidth,
  });

  final EdgeInsetsGeometry? contentPadding;
  @override
  final Color? backgroundColor;
  @override
  final double? elevation;
  @override
  final ShapeBorder? shape;
  final Direction direction;
  @override
  final Duration insetAnimationDuration;
  @override
  final Curve insetAnimationCurve;
  final Color? progressIndicatorColor;
  final double? progressIndicatorStrokeWidth;

  static const double _defaultElevation = 24.0;
  static const RoundedRectangleBorder _defaultDialogShape =
      RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0)));

  @override
  Widget build(BuildContext context) {
    final DialogThemeData dialogTheme = DialogTheme.of(context);
    return AnimatedPadding(
      padding: MediaQuery.of(context).viewInsets +
          const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
      duration: insetAnimationDuration,
      curve: insetAnimationCurve,
      child: MediaQuery.removeViewInsets(
        removeLeft: true,
        removeTop: true,
        removeRight: true,
        removeBottom: true,
        context: context,
        child: Center(
          child: Material(
            color: backgroundColor ??
                dialogTheme.backgroundColor ??
                Theme.of(context).dialogBackgroundColor,
            elevation: elevation ?? dialogTheme.elevation ?? _defaultElevation,
            shape: shape ?? dialogTheme.shape ?? _defaultDialogShape,
            type: MaterialType.card,
            child: SafeArea(
              child: IntrinsicWidth(
                child: Container(
                  padding: contentPadding ??
                      const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: _changeDirection(direction),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Changes the content layout based on direction orientation
  Widget _changeDirection(Direction direction) {
    if (direction.orientations == Orientations.Vertical) {
      return SizedBox(
        width: direction.width,
        height: direction.height ?? (direction.width != null ? direction.width! + 20 : null),
        child: Column(
          mainAxisAlignment:
          direction.mainAxisAlignment ?? MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(
              color: progressIndicatorColor,
              strokeWidth: progressIndicatorStrokeWidth ?? 4.0,
            ),
            if (direction.message != null)
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  direction.message!,
                  style: direction.messageStyle,
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      );
    } else {
      return SizedBox(
        width: direction.width,
        height: direction.height,
        child: Row(
          mainAxisAlignment:
          direction.mainAxisAlignment ?? MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: CircularProgressIndicator(
                color: progressIndicatorColor,
                strokeWidth: progressIndicatorStrokeWidth ?? 4.0,
              ),
            ),
            if (direction.message != null)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    direction.message!,
                    style: direction.messageStyle,
                  ),
                ),
              ),
          ],
        ),
      );
    }
  }
}

