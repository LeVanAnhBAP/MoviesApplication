import 'package:flutter/material.dart';

// Define enums to represent the type, size, and style of the button
enum ButtonType { primary, outline, text }

enum ButtonSize { small, normal, large }

enum ButtonDisplayOptions { fill, hug, fix }

class AppButton extends StatelessWidget {
  final String title;
  final ButtonType type;
  final ButtonSize size;
  final ButtonDisplayOptions style;
  final double? width;
  final bool isDisable;
  final double elevation;
  final VoidCallback onPressed;
  final BorderRadius borderRadius;
  final TextAlign textAlign;
  final EdgeInsets padding;

  // Constructor
  const AppButton(
    this.title, {
    this.type = ButtonType.primary,
    this.size = ButtonSize.normal,
    this.style = ButtonDisplayOptions.fill,
    this.isDisable = false,
    this.elevation = 0.0,
    this.padding = const EdgeInsets.all(10.0),
    this.textAlign = TextAlign.center,
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.width,
    required this.onPressed,
  });

  // Factory method to create an AppButton with corresponding configured properties for primary button
  factory AppButton.primary(
    String title, {
    ButtonSize size = ButtonSize.normal,
    ButtonDisplayOptions style = ButtonDisplayOptions.fill,
    bool isDisable = false,
    double elevation = 0.0,
    double? width,
    required VoidCallback onPressed,
  }) =>
      AppButton._(
        title,
        ButtonType.primary,
        size,
        style,
        isDisable,
        elevation,
        onPressed,
        width: width,
      );

  // Factory method to create an AppButton with corresponding configured properties for outline button
  factory AppButton.outline(
    String title, {
    ButtonSize size = ButtonSize.normal,
    ButtonDisplayOptions style = ButtonDisplayOptions.fill,
    bool isDisable = false,
    double elevation = 0.0,
    double? width,
    required VoidCallback onPressed,
  }) =>
      AppButton._(
        title,
        ButtonType.outline,
        size,
        style,
        isDisable,
        elevation,
        onPressed,
        width: width,
      );

  // Factory method to create an AppButton with corresponding configured properties for text button
  factory AppButton.text(
    String title, {
    ButtonSize size = ButtonSize.normal,
    ButtonDisplayOptions style = ButtonDisplayOptions.fill,
    bool isDisable = false,
    double elevation = 0.0,
    double? width,
    required VoidCallback onPressed,
  }) =>
      AppButton._(
        title,
        ButtonType.text,
        size,
        style,
        isDisable,
        elevation,
        onPressed,
        width: width,
      );

  // Internal method to create AppButton with configured properties from factory methods
  factory AppButton._(
    String title,
    ButtonType type,
    ButtonSize size,
    ButtonDisplayOptions style,
    bool isDisable,
    double elevation,
    VoidCallback onPressed, {
    double? width,
  }) {
    return AppButton(
      title,
      type: type,
      size: size,
      style: style,
      isDisable: isDisable,
      onPressed: onPressed,
      elevation: elevation,
      width: width,
    );
  }

  // Get the height of the button based on button size
  double _getHeight() {
    switch (size) {
      case ButtonSize.small:
        return 36.0;
      case ButtonSize.normal:
        return 40.0;
      case ButtonSize.large:
        return 56.0;
    }
  }

  // Get the text size of the button based on button size
  double _getTextSize() {
    switch (size) {
      case ButtonSize.small:
        return 14;
      case ButtonSize.normal:
        return 16;
      case ButtonSize.large:
        return 20;
    }
  }

  // Get the background color of the button based on type and disabled state
  Color _getBackgroundColor(BuildContext context) {
    if (isDisable == true) {
      if (type != ButtonType.text) {
        return Colors.black38;
      } else {
        return Colors.transparent;
      }
    } else {
      switch (type) {
        case ButtonType.primary:
          return Colors.amber;
        case ButtonType.outline:
          return Colors.white;
        case ButtonType.text:
          return Colors.transparent;
      }
    }
  }

  // Get the text color of the button based on type and disabled state
  Color _getTextColor(BuildContext context) {
    if (isDisable == true) {
      if (type == ButtonType.text) {
        return const Color(0xFFCECECE);
      } else {
        return Colors.white;
      }
    } else {
      switch (type) {
        case ButtonType.primary:
          return Colors.white;
        case ButtonType.outline:
          return const Color(0xFF6A5AE0);
        case ButtonType.text:
          return const Color(0xFF6A5AE0);
      }
    }
  }

  // Get the border color of the button based on type and disabled state (only applicable for outline button)
  Color _getBorderColor(BuildContext context) {
    switch (type) {
      case ButtonType.outline:
        if (isDisable) {
          return const Color(0xFFCECECE);
        }
        return const Color(0xFF6A5AE0);
      default:
        return Colors.transparent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _getHeight(),
      width: _getWidth(),
      child: Material(
        elevation: _getElevation(),
        color: Colors.transparent,
        child: InkWell(
          onTap: isDisable == false ? onPressed : null,
          borderRadius: borderRadius,
          child: Ink(
            decoration: BoxDecoration(
              color: _getBackgroundColor(context),
              borderRadius: borderRadius,
              border: type == ButtonType.outline
                  ? Border.all(
                      color: _getBorderColor(context),
                      width: 1.0,
                    )
                  : null,
            ),
            padding: padding,
            child: Text(
              title,
              textAlign: textAlign,
              style: TextStyle(
                color: _getTextColor(context),
                fontSize: _getTextSize(),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Get the width of the button based on style
  double? _getWidth() {
    return style == ButtonDisplayOptions.fix
        ? width
        : style == ButtonDisplayOptions.fill
            ? double.infinity
            : null;
  }

  // Get the elevation of the button based on type (no elevation for text button)
  double _getElevation() {
    if (type == ButtonType.text) {
      return 0.0;
    } else {
      return elevation;
    }
  }
}
