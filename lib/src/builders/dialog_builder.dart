import 'package:flutter/material.dart';
import '../builders/simple_builder.dart';

/// Builder class containing all AlertDialog attributes
class DialogBuilder {
  /// Style for the text in the [title] of this [AlertDialog].
  ///
  /// If null, [DialogTheme.titleTextStyle] is used, if that's null, defaults to
  /// [ThemeData.textTheme.title].
  final TextStyle? titleTextStyle;

  /// Style for the text in the [content] of this [AlertDialog].
  ///
  /// If null, [DialogTheme.contentTextStyle] is used, if that's null, defaults
  /// to [ThemeData.textTheme.subhead].
  final TextStyle? contentTextStyle;

  /// The (optional) set of actions that are displayed at the bottom of the
  /// dialog.
  ///
  /// Typically this is a list of [TextButton] widgets.
  ///
  /// These widgets will be wrapped in a [OverflowBar], which introduces 8 pixels
  /// of padding on each side.
  ///
  /// If the [title] is not null but the [content] _is_ null, then an extra 20
  /// pixels of padding is added above the [OverflowBar] to separate the [title]
  /// from the [actions].
  final List<Widget>? actions;

  /// The simple builder containing dialog configuration
  final SimpleBuilder simpleBuilder;

  /// Creates a [DialogBuilder] with the given configuration
  const DialogBuilder({
    Key? key,
    this.titleTextStyle,
    required this.simpleBuilder,
    this.contentTextStyle,
    this.actions,
  });
}

