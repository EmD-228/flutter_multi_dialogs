import 'package:flutter/material.dart';
import 'orientations.dart';

/// Configuration for loading dialog direction and layout
class Direction {
  /// Width of the dialog
  final double? width;

  /// Height of the dialog
  final double? height;

  /// Message to display
  final String? message;

  /// Style for the message text
  final TextStyle? messageStyle;

  /// Orientation of the content (vertical or horizontal)
  final Orientations? orientations;

  /// Main axis alignment for the content
  final MainAxisAlignment? mainAxisAlignment;

  /// Creates a [Direction] configuration
  const Direction({
    Key? key,
    this.message,
    this.messageStyle,
    this.orientations,
    this.width,
    this.height,
    this.mainAxisAlignment,
  });
}

