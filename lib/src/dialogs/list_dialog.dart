import 'package:flutter/material.dart';
import '../builders/simple_builder.dart';
import 'custom_dialog.dart';

/// Shows a simple list dialog with item callbacks
///
/// Example:
/// ```dart
/// showSimpleListDialog(
///   context: context,
///   simpleBuilder: const SimpleBuilder(title: Text('Choose an option')),
///   children: items.map((item) => Text(item)).toList(),
///   onItemCallBack: (index) => print('Selected: $index'),
/// );
/// ```
void showSimpleListDialog({
  bool barrierDismissible = true,
  required BuildContext context,
  required SimpleBuilder simpleBuilder,
  required List<Widget> children,
  required Function(int index) onItemCallBack,
  Color? itemHighlightColor,
  EdgeInsetsGeometry? itemPadding,
  bool showDividers = true,
  RouteSettings? routeSettings,
  Duration transitionDuration = const Duration(milliseconds: 200),
  Curve transitionCurve = Curves.easeOut,
}) {
  showDialog<void>(
    context: context,
    barrierDismissible: barrierDismissible,
    routeSettings: routeSettings,
    builder: (BuildContext context) {
      return SimpleListDialog(
        simpleBuilder: simpleBuilder,
        onItemCallBack: onItemCallBack,
        itemHighlightColor: itemHighlightColor,
        itemPadding: itemPadding,
        showDividers: showDividers,
        children: children,
      );
    },
  );
}

/// A dialog that displays a list of items with callbacks
class SimpleListDialog extends StatelessWidget {
  /// Creates a [SimpleListDialog]
  const SimpleListDialog({
    super.key,
    required this.children,
    required this.onItemCallBack,
    this.simpleBuilder,
    this.itemHighlightColor,
    this.itemPadding,
    this.showDividers = true,
  });

  final List<Widget> children;
  final Function(int index) onItemCallBack;
  final SimpleBuilder? simpleBuilder;
  final Color? itemHighlightColor;
  final EdgeInsetsGeometry? itemPadding;
  final bool showDividers;

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterialLocalizations(context));
    final ThemeData theme = Theme.of(context);
    final List<Widget> body = <Widget>[];
    
    for (var index = 0; index < children.length; index++) {
      if (showDividers && index > 0) {
        body.add(const Divider(height: 1));
      }
      
      body.add(
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              Navigator.of(context).pop();
              onItemCallBack(index);
            },
            highlightColor: itemHighlightColor ?? theme.highlightColor,
            splashColor: theme.splashColor,
            child: Padding(
              padding: itemPadding ?? const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 16.0,
              ),
              child: children[index],
            ),
          ),
        ),
      );
    }

    return CustomSimpleDialog(
      simpleBuilder: simpleBuilder ?? const SimpleBuilder(),
      children: body,
    );
  }
}

