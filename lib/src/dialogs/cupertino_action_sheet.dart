import 'package:flutter/cupertino.dart';

/// Shows a Cupertino action sheet (bottom sheet style dialog)
///
/// Action sheets are used to present a set of choices related to the current context.
/// They slide up from the bottom of the screen.
///
/// Example:
/// ```dart
/// showCupertinoActionSheet(
///   context: context,
///   title: 'Choose an option',
///   message: 'Select one of the following options',
///   actions: [
///     CupertinoActionSheetAction(
///       onPressed: () {
///         Navigator.pop(context);
///         // Handle action
///       },
///       child: const Text('Option 1'),
///     ),
///     CupertinoActionSheetAction(
///       onPressed: () {
///         Navigator.pop(context);
///         // Handle action
///       },
///       child: const Text('Option 2'),
///     ),
///   ],
///   cancelButton: CupertinoActionSheetAction(
///     isDestructiveAction: false,
///     onPressed: () => Navigator.pop(context),
///     child: const Text('Cancel'),
///   ),
/// );
/// ```
void showCupertinoActionSheet({
  required BuildContext context,
  String? title,
  String? message,
  List<CupertinoActionSheetAction>? actions,
  CupertinoActionSheetAction? cancelButton,
  bool barrierDismissible = true,
}) {
  showCupertinoModalPopup<void>(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (BuildContext context) {
      return CupertinoActionSheet(
        title: title != null ? Text(title) : null,
        message: message != null ? Text(message) : null,
        actions: actions ?? [],
        cancelButton: cancelButton ??
            CupertinoActionSheetAction(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
      );
    },
  );
}

/// Shows a Cupertino action sheet with a list of items
///
/// This is a convenience function for displaying action sheets with a list of options.
///
/// Example:
/// ```dart
/// showCupertinoListActionSheet(
///   context: context,
///   title: 'Select an item',
///   items: ['Item 1', 'Item 2', 'Item 3'],
///   onItemSelected: (index) {
///     print('Selected: $index');
///   },
/// );
/// ```
void showCupertinoListActionSheet({
  required BuildContext context,
  String? title,
  String? message,
  required List<String> items,
  required Function(int index) onItemSelected,
  bool barrierDismissible = true,
}) {
  showCupertinoModalPopup<void>(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (BuildContext context) {
      return CupertinoActionSheet(
        title: title != null ? Text(title) : null,
        message: message != null ? Text(message) : null,
        actions: items.asMap().entries.map((entry) {
          return CupertinoActionSheetAction(
            onPressed: () {
              Navigator.of(context).pop();
              onItemSelected(entry.key);
            },
            child: Text(entry.value),
          );
        }).toList(),
        cancelButton: CupertinoActionSheetAction(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
      );
    },
  );
}

