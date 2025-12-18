import 'package:flutter/material.dart';

void showBottomDialog({
  required BuildContext context,
  Widget? title,
  EdgeInsetsGeometry? titlePadding,
  EdgeInsetsGeometry contentPadding =
      const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 24.0),
  TextStyle? titleTextStyle,
  Widget? content,
  TextStyle? contentTextStyle,
  List<Widget>? actions,
  Color? backgroundColor,
  double? elevation,
  String? semanticLabel,
  ShapeBorder? shape,
  bool isScrollControlled = false,
}) {
  ShowBottom(
    context: context,
    backgroundColor: backgroundColor,
    elevation: elevation,
    shape: shape,
    isScrollControlled: isScrollControlled,
    title: title,
    titleTextStyle: titleTextStyle,
    titlePadding: titlePadding,
    content: content,
    contentTextStyle: contentTextStyle,
    contentPadding: contentPadding,
    semanticLabel: semanticLabel,
    actions: actions,
  );
}

class ShowBottom {
  final BuildContext context;
  final Widget? title;
  final EdgeInsetsGeometry? titlePadding;
  final EdgeInsetsGeometry contentPadding;
  final TextStyle? titleTextStyle;
  final Widget? content;
  final TextStyle? contentTextStyle;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final double? elevation;
  final String? semanticLabel;
  final ShapeBorder? shape;
  final bool isScrollControlled;

  ShowBottom({
    required this.context,
    this.backgroundColor,
    this.elevation,
    this.shape,
    this.isScrollControlled = false,
    this.title,
    this.titlePadding,
    this.titleTextStyle,
    this.content,
    this.contentPadding = const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 24.0),
    this.contentTextStyle,
    this.actions,
    this.semanticLabel,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return BottomDialog(
          title: title,
          titleTextStyle: titleTextStyle,
          titlePadding: titlePadding,
          content: content,
          contentTextStyle: contentTextStyle,
          contentPadding: contentPadding,
          semanticLabel: semanticLabel,
          actions: actions,
        );
      },
      backgroundColor: backgroundColor,
      elevation: elevation,
      shape: shape,
      isScrollControlled: isScrollControlled,
    );
  }
}

/// Bottom sheet dialog widget that displays an AlertDialog-style content
/// from the bottom of the screen.
class BottomDialog extends StatelessWidget {
  final Widget? title;

  final EdgeInsetsGeometry? titlePadding;

  final TextStyle? titleTextStyle;

  final Widget? content;

  final EdgeInsetsGeometry contentPadding;

  final TextStyle? contentTextStyle;

  final List<Widget>? actions;

  /// Semantic label for accessibility
  final String? semanticLabel;

  const BottomDialog({
    super.key,
    this.title,
    this.titlePadding,
    this.titleTextStyle,
    this.content,
    this.contentPadding = const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 24.0),
    this.contentTextStyle,
    this.actions,
    this.semanticLabel,
  });

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterialLocalizations(context));
    final ThemeData theme = Theme.of(context);
    final DialogThemeData dialogTheme = DialogTheme.of(context);
    final List<Widget> children = <Widget>[];
    String? label = semanticLabel;

    if (title != null) {
      children.add(Padding(
        padding: titlePadding ??
            EdgeInsets.fromLTRB(24.0, 24.0, 24.0, content == null ? 20.0 : 0.0),
        child: DefaultTextStyle(
          style: titleTextStyle ??
              dialogTheme.titleTextStyle ??
              theme.textTheme.titleLarge ??
              const TextStyle(),
          child: Semantics(
            namesRoute: true,
            container: true,
            child: title!,
          ),
        ),
      ));
    }

    if (content != null) {
      children.add(Flexible(
        child: Padding(
          padding: contentPadding,
          child: DefaultTextStyle(
            style: contentTextStyle ??
                dialogTheme.contentTextStyle ??
                theme.textTheme.bodyMedium ??
                const TextStyle(),
            child: content!,
          ),
        ),
      ));
    }
    if (actions != null && actions!.isNotEmpty) {
      children.add(OverflowBar(
        children: actions!,
      ));
    }

    Widget dialogChild = IntrinsicWidth(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      ),
    );

    if (label != null) {
      dialogChild = Semantics(
        namesRoute: true,
        label: label,
        child: dialogChild,
      );
    }

    return dialogChild;
  }
}
