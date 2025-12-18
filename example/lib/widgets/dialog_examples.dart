import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_dialogs/flutter_multi_dialogs.dart';

import '../constants/app_constants.dart';
import '../show_bottom_dialog.dart';

/// Widget containing all dialog example buttons
class DialogExamples extends StatelessWidget {
  const DialogExamples({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Dialog Examples",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              "Preset Dialogs",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          _DialogButton(
            label: "showSuccessDialog",
            onPressed: () => _showSuccessDialogExample(context),
          ),
          const SizedBox(height: 8),
          _DialogButton(
            label: "showErrorDialog",
            onPressed: () => _showErrorDialogExample(context),
          ),
          const SizedBox(height: 8),
          _DialogButton(
            label: "showWarningDialog",
            onPressed: () => _showWarningDialogExample(context),
          ),
          const SizedBox(height: 8),
          _DialogButton(
            label: "showInfoDialog",
            onPressed: () => _showInfoDialogExample(context),
          ),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              "Custom Dialogs",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 8),
          _DialogButton(
            label: "showAlertDialog",
            onPressed: () => _showAlertDialogExample(context),
          ),
          const SizedBox(height: 8),
          _DialogButton(
            label: "showSimpleListDialog",
            onPressed: () => _showSimpleListDialogExample(context),
          ),
          const SizedBox(height: 8),
          _DialogButton(
            label: "showLoadingDialog",
            onPressed: () => _showLoadingDialogExample(context),
          ),
          const SizedBox(height: 8),
          _DialogButton(
            label: "showBottomDialog",
            onPressed: () => _showBottomDialogExample(context),
          ),
          const SizedBox(height: 8),
          _DialogButton(
            label: "showCustomAlertDialog",
            onPressed: () => _showCustomAlertDialogExample(context),
          ),
          const SizedBox(height: 8),
          _DialogButton(
            label: "showCustomSimpleDialog",
            onPressed: () => _showCustomSimpleDialogExample(context),
          ),
          const SizedBox(height: 8),
          _DialogButton(
            label: "showCustomDialog",
            onPressed: () => _showCustomDialogExample(context),
          ),
          const SizedBox(height: 8),
          _DialogButton(
            label: "showDatePicker",
            onPressed: () => _showDatePickerExample(context),
          ),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              "Adaptive Dialogs (Auto-detect Platform)",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 8),
          _DialogButton(
            label: "showAdaptiveAlertDialog",
            onPressed: () => _showAdaptiveAlertDialogExample(context),
          ),
          const SizedBox(height: 8),
          _DialogButton(
            label: "showAdaptiveSuccessDialog",
            onPressed: () => _showAdaptiveSuccessDialogExample(context),
          ),
          const SizedBox(height: 8),
          _DialogButton(
            label: "showAdaptiveErrorDialog",
            onPressed: () => _showAdaptiveErrorDialogExample(context),
          ),
          const SizedBox(height: 8),
          _DialogButton(
            label: "showAdaptiveWarningDialog",
            onPressed: () => _showAdaptiveWarningDialogExample(context),
          ),
          const SizedBox(height: 8),
          _DialogButton(
            label: "showAdaptiveInfoDialog",
            onPressed: () => _showAdaptiveInfoDialogExample(context),
          ),
          const SizedBox(height: 8),
          _DialogButton(
            label: "showAdaptiveLoadingDialog",
            onPressed: () => _showAdaptiveLoadingDialogExample(context),
          ),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              "Cupertino (iOS) Dialogs",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 8),
          _DialogButton(
            label: "showCupertinoAlertDialog",
            onPressed: () => _showCupertinoAlertDialogExample(context),
          ),
          const SizedBox(height: 8),
          _DialogButton(
            label: "showCupertinoActionSheet",
            onPressed: () => _showCupertinoActionSheetExample(context),
          ),
          const SizedBox(height: 8),
          _DialogButton(
            label: "showCupertinoLoadingDialog",
            onPressed: () => _showCupertinoLoadingDialogExample(context),
          ),
          const SizedBox(height: 8),
          _DialogButton(
            label: "showCupertinoSuccessDialog",
            onPressed: () => _showCupertinoSuccessDialogExample(context),
          ),
          const SizedBox(height: 8),
          _DialogButton(
            label: "showCupertinoErrorDialog",
            onPressed: () => _showCupertinoErrorDialogExample(context),
          ),
          const SizedBox(height: 8),
          _DialogButton(
            label: "showCupertinoWarningDialog",
            onPressed: () => _showCupertinoWarningDialogExample(context),
          ),
          const SizedBox(height: 8),
          _DialogButton(
            label: "showCupertinoInfoDialog",
            onPressed: () => _showCupertinoInfoDialogExample(context),
          ),
        ],
      ),
    );
  }

  void _showAlertDialogExample(BuildContext context) {
    showAlertDialog(
      context: context,
      title: const Text("Title"),
      content: const Text("This is the content"),
      semanticLabel: "AlertDialog Extension",
      actions: <Widget>[
        TextButton(
          child: const Text("Confirm"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text("Cancel"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  void _showSimpleListDialogExample(BuildContext context) {
    showSimpleListDialog(
      context: context,
      simpleBuilder: const SimpleBuilder(),
      children: <Widget>[
        for (var item in AppConstants.sampleItems) Text(item),
      ],
      onItemCallBack: (index) {
        debugPrint('Selected item: ${AppConstants.sampleItems[index]}');
      },
    );
  }

  void _showLoadingDialogExample(BuildContext context) {
    showLoadingDialog(
      context: context,
      direction: const Direction(
        message: "Loading...",
        orientations: Orientations.horizontal,
        width: 120,
      ),
    );
  }

  void _showBottomDialogExample(BuildContext context) {
    showBottomDialog(
      context: context,
      title: const Text("Title"),
      content: const Text("This is the content"),
      isScrollControlled: true,
      backgroundColor: Colors.deepOrange,
      actions: <Widget>[
        TextButton(
          child: const Text("Confirm"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        TextButton(
          child: const Text("Cancel"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  void _showCustomAlertDialogExample(BuildContext context) {
    showCustomAlertDialog(
      context: context,
      dialogBuilder: DialogBuilder(
        simpleBuilder: SimpleBuilder(
          title: const Text("Title"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                for (var item in AppConstants.sampleItems)
                  InkWell(
                    child: Text(item),
                    onTap: () {
                      debugPrint('Tapped item: $item');
                    },
                  ),
              ],
            ),
          ),
        ),
      ),
      confirmWidget: const Text("Confirm"),
      cancelWidget: const Text("Cancel"),
      onConfirmCallBack: () {
        Navigator.pop(context);
      },
      onCancelCallBack: () {
        Navigator.pop(context);
      },
    );
  }

  void _showCustomSimpleDialogExample(BuildContext context) {
    showCustomSimpleDialog(
      context: context,
      simpleBuilder: const SimpleBuilder(),
      children: <Widget>[const Text("Custom Dialog")],
    );
  }

  void _showCustomDialogExample(BuildContext context) {
    showCustomDialog(
      context: context,
      gravity: 0,
      child: const Text("showCustomDialog"),
    );
  }

  void _showDatePickerExample(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime(2030),
    );
  }

  void _showSuccessDialogExample(BuildContext context) {
    showSuccessDialog(
      context: context,
      title: 'Success!',
      message: 'Operation completed successfully.',
      onConfirm: () {
        debugPrint('Success dialog confirmed');
      },
    );
  }

  void _showErrorDialogExample(BuildContext context) {
    showErrorDialog(
      context: context,
      title: 'Error',
      message: 'An error occurred while processing your request.',
      error: 'Error code: 500\nServer timeout',
      onConfirm: () {
        debugPrint('Error dialog confirmed');
      },
    );
  }

  void _showWarningDialogExample(BuildContext context) {
    showWarningDialog(
      context: context,
      title: 'Warning',
      message:
          'Are you sure you want to delete this item? This action cannot be undone.',
      confirmText: 'Delete',
      cancelText: 'Cancel',
      onConfirm: () {
        debugPrint('Warning dialog confirmed - proceeding with deletion');
      },
      onCancel: () {
        debugPrint('Warning dialog cancelled');
      },
    );
  }

  void _showInfoDialogExample(BuildContext context) {
    showInfoDialog(
      context: context,
      title: 'Information',
      message:
          'This is an informational message. You can use this to provide helpful context to users.',
      onConfirm: () {
        debugPrint('Info dialog confirmed');
      },
    );
  }

  // Cupertino Dialog Examples
  void _showCupertinoAlertDialogExample(BuildContext context) {
    showCupertinoAlertDialog(
      context: context,
      title: 'Confirm Action',
      content: 'Are you sure you want to proceed with this action?',
      actions: [
        CupertinoDialogAction(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: () => Navigator.pop(context),
          child: const Text('Confirm'),
        ),
      ],
    );
  }

  void _showCupertinoActionSheetExample(BuildContext context) {
    showCupertinoActionSheet(
      context: context,
      title: 'Choose an Option',
      message: 'Select one of the following options',
      actions: [
        CupertinoActionSheetAction(
          onPressed: () {
            Navigator.pop(context);
            debugPrint('Option 1 selected');
          },
          child: const Text('Option 1'),
        ),
        CupertinoActionSheetAction(
          onPressed: () {
            Navigator.pop(context);
            debugPrint('Option 2 selected');
          },
          child: const Text('Option 2'),
        ),
        CupertinoActionSheetAction(
          isDestructiveAction: true,
          onPressed: () {
            Navigator.pop(context);
            debugPrint('Destructive action selected');
          },
          child: const Text('Delete'),
        ),
      ],
    );
  }

  void _showCupertinoLoadingDialogExample(BuildContext context) {
    showCupertinoLoadingDialog(
      context: context,
      direction: const Direction(
        message: 'Loading...',
        orientations: Orientations.horizontal,
      ),
    );
    // Auto-dismiss after 2 seconds for demo
    Future.delayed(const Duration(seconds: 2), () {
      if (context.mounted) {
        Navigator.pop(context);
      }
    });
  }

  void _showCupertinoSuccessDialogExample(BuildContext context) {
    showCupertinoSuccessDialog(
      context: context,
      title: 'Success!',
      message: 'Operation completed successfully.',
      onConfirm: () {
        debugPrint('Cupertino success dialog confirmed');
      },
    );
  }

  void _showCupertinoErrorDialogExample(BuildContext context) {
    showCupertinoErrorDialog(
      context: context,
      title: 'Error',
      message: 'An error occurred while processing your request.',
      error: 'Error code: 500',
      onConfirm: () {
        debugPrint('Cupertino error dialog confirmed');
      },
    );
  }

  void _showCupertinoWarningDialogExample(BuildContext context) {
    showCupertinoWarningDialog(
      context: context,
      title: 'Warning',
      message: 'Are you sure you want to continue?',
      confirmText: 'Continue',
      cancelText: 'Cancel',
      onConfirm: () {
        debugPrint('Cupertino warning dialog confirmed');
      },
      onCancel: () {
        debugPrint('Cupertino warning dialog cancelled');
      },
    );
  }

  void _showCupertinoInfoDialogExample(BuildContext context) {
    showCupertinoInfoDialog(
      context: context,
      title: 'Information',
      message: 'This is an informational message with iOS styling.',
      onConfirm: () {
        debugPrint('Cupertino info dialog confirmed');
      },
    );
  }

  // Adaptive Dialog Examples (Auto-detect platform)
  void _showAdaptiveAlertDialogExample(BuildContext context) {
    showAdaptiveAlertDialog(
      context: context,
      title: 'Confirm Action',
      content:
          'This dialog automatically uses Cupertino on iOS and Material on Android.',
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Confirm'),
        ),
      ],
    );
  }

  void _showAdaptiveSuccessDialogExample(BuildContext context) {
    showAdaptiveSuccessDialog(
      context: context,
      title: 'Success!',
      message:
          'Operation completed successfully. This dialog adapts to the platform.',
      onConfirm: () {
        debugPrint('Adaptive success dialog confirmed');
      },
    );
  }

  void _showAdaptiveErrorDialogExample(BuildContext context) {
    showAdaptiveErrorDialog(
      context: context,
      title: 'Error',
      message: 'An error occurred. This dialog adapts to the platform.',
      error: 'Error code: 500',
      onConfirm: () {
        debugPrint('Adaptive error dialog confirmed');
      },
    );
  }

  void _showAdaptiveWarningDialogExample(BuildContext context) {
    showAdaptiveWarningDialog(
      context: context,
      title: 'Warning',
      message: 'Are you sure? This dialog adapts to the platform.',
      confirmText: 'Continue',
      cancelText: 'Cancel',
      onConfirm: () {
        debugPrint('Adaptive warning dialog confirmed');
      },
      onCancel: () {
        debugPrint('Adaptive warning dialog cancelled');
      },
    );
  }

  void _showAdaptiveInfoDialogExample(BuildContext context) {
    showAdaptiveInfoDialog(
      context: context,
      title: 'Information',
      message:
          'This is an adaptive dialog that uses the native platform style.',
      onConfirm: () {
        debugPrint('Adaptive info dialog confirmed');
      },
    );
  }

  void _showAdaptiveLoadingDialogExample(BuildContext context) {
    showAdaptiveLoadingDialog(
      context: context,
      direction: const Direction(
        message: 'Loading...',
        orientations: Orientations.horizontal,
      ),
    );
    // Auto-dismiss after 2 seconds for demo
    Future.delayed(const Duration(seconds: 2), () {
      if (context.mounted) {
        Navigator.pop(context);
      }
    });
  }
}

/// Reusable button widget for dialog examples
class _DialogButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const _DialogButton({
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        label,
        style: AppConstants.defaultButtonTextStyle,
      ),
      onTap: onPressed,
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
    );
  }
}
