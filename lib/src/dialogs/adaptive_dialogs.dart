import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../utils/platform_helper.dart';
import 'alert_dialog.dart' as material_alert;
import 'cupertino_alert_dialog.dart' as cupertino_alert;
import 'loading_dialog.dart' as material_loading;
import 'cupertino_loading_dialog.dart' as cupertino_loading;
import 'preset_dialogs.dart' as material_preset;
import 'cupertino_preset_dialogs.dart' as cupertino_preset;
import '../models/direction.dart';

/// Shows an adaptive alert dialog that automatically uses Cupertino on iOS and Material on Android
///
/// Example:
/// ```dart
/// showAdaptiveAlertDialog(
///   context: context,
///   title: 'Confirm',
///   content: 'Are you sure?',
///   actions: [
///     TextButton(
///       onPressed: () => Navigator.pop(context),
///       child: const Text('OK'),
///     ),
///   ],
/// );
/// ```
void showAdaptiveAlertDialog({
  required BuildContext context,
  String? title,
  String? content,
  List<Widget>? actions,
  bool barrierDismissible = true,
}) {
  if (PlatformHelper.isIOS) {
    cupertino_alert.showCupertinoAlertDialog(
      context: context,
      title: title,
      content: content,
      actions: actions?.map((action) {
        if (action is TextButton && action.child != null) {
          return CupertinoDialogAction(
            onPressed: () {
              Navigator.of(context).pop();
              action.onPressed?.call();
            },
            child: action.child!,
          );
        }
        return CupertinoDialogAction(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('OK'),
        );
      }).toList(),
      barrierDismissible: barrierDismissible,
    );
  } else {
    material_alert.showAlertDialog(
      context: context,
      title: title != null ? Text(title) : null,
      content: content != null ? Text(content) : null,
      actions: actions,
      barrierDismissible: barrierDismissible,
    );
  }
}

/// Shows an adaptive loading dialog that automatically uses Cupertino on iOS and Material on Android
///
/// Example:
/// ```dart
/// showAdaptiveLoadingDialog(
///   context: context,
///   direction: const Direction(
///     message: 'Loading...',
///     orientations: Orientations.horizontal,
///   ),
/// );
/// ```
void showAdaptiveLoadingDialog({
  required BuildContext context,
  required Direction direction,
  bool barrierDismissible = false,
}) {
  if (PlatformHelper.isIOS) {
    cupertino_loading.showCupertinoLoadingDialog(
      context: context,
      direction: direction,
      barrierDismissible: barrierDismissible,
    );
  } else {
    material_loading.showLoadingDialog(
      context: context,
      direction: direction,
      barrierDismissible: barrierDismissible,
    );
  }
}

/// Shows an adaptive success dialog that automatically uses Cupertino on iOS and Material on Android
///
/// Example:
/// ```dart
/// showAdaptiveSuccessDialog(
///   context: context,
///   title: 'Success!',
///   message: 'Operation completed successfully.',
///   onConfirm: () => Navigator.pop(context),
/// );
/// ```
void showAdaptiveSuccessDialog({
  required BuildContext context,
  String? title,
  required String message,
  String? confirmText,
  VoidCallback? onConfirm,
  Color? iconColor,
  bool barrierDismissible = true,
}) {
  if (PlatformHelper.isIOS) {
    cupertino_preset.showCupertinoSuccessDialog(
      context: context,
      title: title,
      message: message,
      confirmText: confirmText,
      onConfirm: onConfirm,
      iconColor: iconColor,
      barrierDismissible: barrierDismissible,
    );
  } else {
    material_preset.showSuccessDialog(
      context: context,
      title: title,
      message: message,
      confirmText: confirmText,
      onConfirm: onConfirm,
      iconColor: iconColor,
      barrierDismissible: barrierDismissible,
    );
  }
}

/// Shows an adaptive error dialog that automatically uses Cupertino on iOS and Material on Android
///
/// Example:
/// ```dart
/// showAdaptiveErrorDialog(
///   context: context,
///   title: 'Error',
///   message: 'An error occurred.',
///   onConfirm: () => Navigator.pop(context),
/// );
/// ```
void showAdaptiveErrorDialog({
  required BuildContext context,
  String? title,
  required String message,
  String? error,
  String? confirmText,
  VoidCallback? onConfirm,
  Color? iconColor,
  bool barrierDismissible = true,
}) {
  if (PlatformHelper.isIOS) {
    cupertino_preset.showCupertinoErrorDialog(
      context: context,
      title: title,
      message: message,
      error: error,
      confirmText: confirmText,
      onConfirm: onConfirm,
      iconColor: iconColor,
      barrierDismissible: barrierDismissible,
    );
  } else {
    material_preset.showErrorDialog(
      context: context,
      title: title,
      message: message,
      error: error,
      confirmText: confirmText,
      onConfirm: onConfirm,
      iconColor: iconColor,
      barrierDismissible: barrierDismissible,
    );
  }
}

/// Shows an adaptive warning dialog that automatically uses Cupertino on iOS and Material on Android
///
/// Example:
/// ```dart
/// showAdaptiveWarningDialog(
///   context: context,
///   title: 'Warning',
///   message: 'Are you sure?',
///   onConfirm: () => Navigator.pop(context),
/// );
/// ```
void showAdaptiveWarningDialog({
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
  if (PlatformHelper.isIOS) {
    cupertino_preset.showCupertinoWarningDialog(
      context: context,
      title: title,
      message: message,
      confirmText: confirmText,
      cancelText: cancelText,
      onConfirm: onConfirm,
      onCancel: onCancel,
      iconColor: iconColor,
      barrierDismissible: barrierDismissible,
    );
  } else {
    material_preset.showWarningDialog(
      context: context,
      title: title,
      message: message,
      confirmText: confirmText,
      cancelText: cancelText,
      onConfirm: onConfirm,
      onCancel: onCancel,
      iconColor: iconColor,
      barrierDismissible: barrierDismissible,
    );
  }
}

/// Shows an adaptive info dialog that automatically uses Cupertino on iOS and Material on Android
///
/// Example:
/// ```dart
/// showAdaptiveInfoDialog(
///   context: context,
///   title: 'Information',
///   message: 'This is an informational message.',
///   onConfirm: () => Navigator.pop(context),
/// );
/// ```
void showAdaptiveInfoDialog({
  required BuildContext context,
  String? title,
  required String message,
  String? confirmText,
  VoidCallback? onConfirm,
  Color? iconColor,
  bool barrierDismissible = true,
}) {
  if (PlatformHelper.isIOS) {
    cupertino_preset.showCupertinoInfoDialog(
      context: context,
      title: title,
      message: message,
      confirmText: confirmText,
      onConfirm: onConfirm,
      iconColor: iconColor,
      barrierDismissible: barrierDismissible,
    );
  } else {
    material_preset.showInfoDialog(
      context: context,
      title: title,
      message: message,
      confirmText: confirmText,
      onConfirm: onConfirm,
      iconColor: iconColor,
      barrierDismissible: barrierDismissible,
    );
  }
}

