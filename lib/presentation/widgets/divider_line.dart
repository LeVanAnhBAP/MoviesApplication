import 'package:flutter/material.dart';

class DividerLine extends StatelessWidget {
  final double sizeLine;
  final EdgeInsetsGeometry? margin;
  final double width;
  final Color color;

  const DividerLine({
    super.key,
    this.sizeLine = 0.5,
    this.margin = const EdgeInsets.symmetric(vertical: 8),
    required this.width,
    this.color = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: sizeLine,
      margin: margin,
      width: width,
      color: color,
    );
  }
}
