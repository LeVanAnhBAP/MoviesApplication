import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIconSvg extends StatelessWidget {
  final String path;
  final bool isSelected;
  final double size;

  const CustomIconSvg({
    super.key,
    required this.path,
    this.isSelected = false,
    this.size = 24,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      width: size,
      height: size,
      colorFilter: ColorFilter.mode(
        isSelected ? Colors.amber : Colors.white,
        BlendMode.srcIn,
      ),
    );
  }
}
