import 'package:movies_app/core/extensions/theme.dart';
import 'package:movies_app/core/themes/themes.dart';
import 'package:flutter/material.dart';

class AppThemeBuilder extends StatelessWidget {
  final Widget Function(AppTheme theme) builder;

  const AppThemeBuilder({
    super.key,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return builder(context.appTheme);
  }
}
