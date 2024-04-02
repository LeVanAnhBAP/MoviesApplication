import 'package:flutter/material.dart';
import 'package:movies_app/core/extensions/theme.dart';

class SearchField extends StatefulWidget {
  final String? placeholder;
  final double fontSize;
  final double backgroundOpacity;
  final double placeholderOpacity;
  final EdgeInsetsGeometry padding;
  final Color? backgroundColor;
  final Color cursorColor;
  final Color? placeholderColor;
  final BorderRadius borderRadius;
  final bool isPrefixIcon;
  final Function(String value) onSearchValue;

  const SearchField({
    super.key,
    required this.onSearchValue,
    this.placeholder,
    this.fontSize = 16,
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.padding = const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
    this.backgroundColor,
    this.placeholderColor,
    this.backgroundOpacity = 0.2,
    this.placeholderOpacity = 0.5,
    this.isPrefixIcon = false,
    this.cursorColor = Colors.white,
  });

  @override
  State<StatefulWidget> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: widget.placeholder,
        prefixIcon: widget.isPrefixIcon
            ? Icon(
                Icons.search_outlined,
                color: context.colors.background,
              )
            : null,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: widget.borderRadius,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: widget.borderRadius,
        ),
        hintStyle: context.typographies.body.copyWith(
          color: (widget.placeholderColor ?? Colors.white),
          fontSize: widget.fontSize,
        ),
        contentPadding: widget.padding,
        fillColor: (widget.backgroundColor ?? Colors.amber),
      ),
      autocorrect: false,
      cursorColor: widget.cursorColor,
      style: context.typographies.caption1.copyWith(fontSize: widget.fontSize),
      onChanged: widget.onSearchValue,
    );
  }
}
