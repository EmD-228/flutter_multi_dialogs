import 'package:flutter/material.dart';
import 'package:multiple_dialog/multiple_dialog.dart';
import '../constants/app_constants.dart';
import '../showBottomDialog.dart';

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
              "Custom Dialog Examples",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
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
        orientations: Orientations.Horizontal,
        width: 120,
      ),
    );
  }

  void _showBottomDialogExample(BuildContext context) {
    showBottomDialog(
      context: context,
      title: const Text("Title"),
      content: Container(child: const Text("This is the content")),
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
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: AppConstants.defaultButtonElevation,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: AppConstants.defaultButtonTextStyle,
      ),
    );
  }
}

