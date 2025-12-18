import 'package:flutter/cupertino.dart';
import '../models/direction.dart';
import '../models/orientations.dart';

/// Shows a Cupertino loading dialog with customizable orientation and message
///
/// Example:
/// ```dart
/// showCupertinoLoadingDialog(
///   context: context,
///   direction: const Direction(
///     message: "Loading...",
///     orientations: Orientations.horizontal,
///   ),
/// );
/// ```
void showCupertinoLoadingDialog({
  required BuildContext context,
  required Direction direction,
  bool barrierDismissible = false,
  Color? activityIndicatorColor,
}) {
  showCupertinoDialog<void>(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (BuildContext context) {
      return CupertinoLoadingDialog(
        direction: direction,
        activityIndicatorColor: activityIndicatorColor,
      );
    },
  );
}

/// Cupertino loading dialog widget with customizable orientation and message
class CupertinoLoadingDialog extends StatelessWidget {
  /// Creates a [CupertinoLoadingDialog]
  const CupertinoLoadingDialog({
    super.key,
    required this.direction,
    this.activityIndicatorColor,
  });

  final Direction direction;
  final Color? activityIndicatorColor;

  @override
  Widget build(BuildContext context) {
    return CupertinoPopupSurface(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        child: _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    if (direction.orientations == Orientations.vertical) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment:
            direction.mainAxisAlignment ?? MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CupertinoActivityIndicator(
            color: activityIndicatorColor,
          ),
          if (direction.message != null) ...[
            const SizedBox(height: 16),
            Text(
              direction.message!,
              style: direction.messageStyle,
              textAlign: TextAlign.center,
            ),
          ],
        ],
      );
    } else {
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment:
            direction.mainAxisAlignment ?? MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CupertinoActivityIndicator(
            color: activityIndicatorColor,
          ),
          if (direction.message != null) ...[
            const SizedBox(width: 16),
            Flexible(
              child: Text(
                direction.message!,
                style: direction.messageStyle,
              ),
            ),
          ],
        ],
      );
    }
  }
}
