import 'package:flutter/material.dart';
import 'package:movies_app/core/extensions/text_style.dart';
import 'package:movies_app/core/themes/typography.dart';
import 'package:movies_app/core/themes/styles.dart';
import 'package:movies_app/fonts.gen.dart';

import 'colors.dart';

const AppTheme darkTheme = AppTheme(
  name: 'dark',
  brightness: Brightness.dark,
  colors: AppColors(
    primarySwatch: Colors.deepPurple,
    backgroundAppbar: Colors.black87,
    primary: Color(0xFF2ECC71),
    secondary: Color(0xFFFFAB49),
    accent: Color(0xFFFFFFFF),
    background: Color(0xFF180808),
    backgroundDark: Color(0xFF0E1118),
    disabled: Color(0xFF9CA4AF),
    information: Color(0xFF5487F5),
    success: Color(0xFF19C18F),
    alert: Color(0xFFFBA707),
    warning: Color(0xFFFF9D5C),
    error: Color(0xFFFF0000),
    text: Color(0xFFFFFFFF),
    border: Color(0xFF454F60),
    hint: Color(0xFF888B8E),
    divider: Color(0xFFD9D9D9),
  ),
  typographies: AppTypography(
    title1: TextStyle(
      fontFamily: FontFamily.inter,
      fontSize: 32,
      fontWeight: FontWeight.w700,
      height: 1.3,
    ),
    title1SemiBold: TextStyle(
      fontFamily: FontFamily.inter,
      fontSize: 32,
      fontWeight: FontWeight.w600,
      height: 1.3,
    ),
    title1Normal: TextStyle(
      fontFamily: FontFamily.inter,
      fontSize: 32,
      fontWeight: FontWeight.w400,
      height: 1.3,
    ),
    title2: TextStyle(
      fontFamily: FontFamily.inter,
      fontSize: 24,
      fontWeight: FontWeight.w600,
      height: 1.3,
    ),
    title2Bold: TextStyle(
      fontFamily: FontFamily.inter,
      fontSize: 24,
      fontWeight: FontWeight.w700,
      height: 1.3,
    ),
    title3: TextStyle(
      fontFamily: FontFamily.inter,
      fontSize: 18,
      fontWeight: FontWeight.w600,
      height: 1.3,
    ),
    title3Bold: TextStyle(
      fontFamily: FontFamily.inter,
      fontSize: 18,
      fontWeight: FontWeight.w700,
      height: 1.3,
    ),
    body: TextStyle(
      fontFamily: FontFamily.inter,
      fontSize: 17,
      fontWeight: FontWeight.w400,
      height: 1.3,
    ),
    bodyBold: TextStyle(
      fontFamily: FontFamily.inter,
      fontSize: 17,
      fontWeight: FontWeight.w600,
      height: 1.3,
    ),
    caption1: TextStyle(
      fontFamily: FontFamily.inter,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 1.3,
    ),
    caption1Bold: TextStyle(
      fontFamily: FontFamily.inter,
      fontSize: 14,
      fontWeight: FontWeight.w600,
      height: 1.3,
    ),
    caption2: TextStyle(
      fontFamily: FontFamily.inter,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      height: 1.3,
    ),
    caption2Bold: TextStyle(
      fontFamily: FontFamily.inter,
      fontSize: 12,
      fontWeight: FontWeight.w600,
      height: 1.3,
    ),
  ),
  styles: AppStyles(
    buttonSmall: ButtonStyle(
      padding: MaterialStatePropertyAll(
        EdgeInsets.symmetric(vertical: 6, horizontal: 24),
      ),
      shape: MaterialStatePropertyAll(
        StadiumBorder(),
      ),
      textStyle: MaterialStatePropertyAll(
        TextStyle(
          fontFamily: FontFamily.inter,
          fontSize: 12,
          fontWeight: FontWeight.w600,
          height: 1.3,
        ),
      ),
      minimumSize: MaterialStatePropertyAll(Size.zero),
    ),
    buttonMedium: ButtonStyle(
      padding: MaterialStatePropertyAll(
        EdgeInsets.symmetric(vertical: 12, horizontal: 24),
      ),
      shape: MaterialStatePropertyAll(
        StadiumBorder(),
      ),
      textStyle: MaterialStatePropertyAll(
        TextStyle(
          fontFamily: FontFamily.inter,
          fontSize: 16,
          fontWeight: FontWeight.w600,
          height: 1.3,
        ),
      ),
      minimumSize: MaterialStatePropertyAll(Size.zero),
    ),
    buttonLarge: ButtonStyle(
      padding: MaterialStatePropertyAll(
        EdgeInsets.symmetric(vertical: 18, horizontal: 24),
      ),
      shape: MaterialStatePropertyAll(
        StadiumBorder(),
      ),
      textStyle: MaterialStatePropertyAll(
        TextStyle(
          fontFamily: FontFamily.inter,
          fontSize: 17,
          fontWeight: FontWeight.w600,
          height: 1.3,
        ),
      ),
      minimumSize: MaterialStatePropertyAll(Size.zero),
    ),
    buttonText: ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(Colors.transparent),
      padding: MaterialStatePropertyAll(EdgeInsets.zero),
      // splashFactory: NoSplash.splashFactory,
      textStyle: MaterialStatePropertyAll(
        TextStyle(
          fontFamily: FontFamily.inter,
          fontSize: 17,
          fontWeight: FontWeight.w600,
          height: 1.3,
        ),
      ),
    ),
    shadow: [
      BoxShadow(
        color: Color(0xFFFFFFFF),
        offset: Offset(0, 4),
        blurRadius: 4,
        spreadRadius: 0,
      ),
    ],
  ),
);

class AppTheme extends ThemeExtension<AppTheme> {
  static const AppTheme dark = darkTheme;
  static const AppTheme defaultTheme = darkTheme;

  final String name;
  final Brightness brightness;
  final AppColors colors;
  final AppTypography typographies;
  final AppStyles styles;

  const AppTheme({
    required this.name,
    required this.brightness,
    required this.colors,
    required this.typographies,
    required this.styles,
  });

  ColorScheme get _baseColorScheme => brightness == Brightness.dark
      ? const ColorScheme.dark() //
      : const ColorScheme.light();

  ThemeData get themeData => ThemeData(
        platform: TargetPlatform.iOS,
        extensions: [this],
        primarySwatch: colors.primarySwatch,
        primaryColor: colors.primary,
        unselectedWidgetColor: colors.hint,
        disabledColor: colors.disabled,
        scaffoldBackgroundColor: colors.primary,
        hintColor: colors.hint,
        dividerColor: colors.border,
        colorScheme: _baseColorScheme.copyWith(
          primary: colors.primary,
          onPrimary: colors.text,
          secondary: colors.secondary,
          onSecondary: colors.text,
          error: colors.error,
          shadow: colors.border,
          background: colors.background,
          onBackground: colors.text,
        ),
        textTheme: TextTheme(
          bodyMedium: typographies.body,
        ),
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: colors.primary,
          titleTextStyle: typographies.title3,
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: styles.buttonLarge.copyWith(
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              return states.contains(MaterialState.disabled)
                  ? colors.disabled
                  : null; // Defer to the widget's default.
            }),
            foregroundColor: MaterialStateProperty.resolveWith((states) {
              return states.contains(MaterialState.disabled)
                  ? colors.text
                  : null; // Defer to the widget's default.
            }),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: styles.buttonLarge.copyWith(
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              return states.contains(MaterialState.disabled)
                  ? colors.disabled
                  : null; // Defer to the widget's default.
            }),
            foregroundColor: MaterialStateProperty.resolveWith((states) {
              return states.contains(MaterialState.disabled)
                  ? colors.text
                  : null; // Defer to the widget's default.
            }),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: styles.buttonLarge.copyWith(
            side: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.disabled)) {
                return BorderSide(color: colors.disabled);
              }

              if (states.isEmpty ||
                  [
                    MaterialState.pressed,
                    MaterialState.hovered,
                    MaterialState.focused,
                  ].any(states.contains)) {
                return BorderSide(color: colors.primary);
              }

              return null;
            }),
            foregroundColor: MaterialStateProperty.resolveWith((states) {
              return states.contains(MaterialState.disabled)
                  ? colors.disabled
                  : null; // Defer to the widget's default.
            }),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: styles.buttonLarge.copyWith(
            foregroundColor:
                MaterialStateProperty.resolveWith((Set<MaterialState> states) {
              return states.contains(MaterialState.disabled)
                  ? colors.disabled
                  : null; // Defer to the widget's default.
            }),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 17, horizontal: 16),
          hintStyle: typographies.body.withColor(colors.hint),
          labelStyle: typographies.body.withColor(colors.hint),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
          enabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
          filled: true,
          fillColor: colors.background,
          errorStyle: typographies.caption2,
          errorMaxLines: 3,
        ),
        radioTheme: const RadioThemeData(
          visualDensity: VisualDensity(horizontal: -4, vertical: -4),
        ),
        dividerTheme: DividerThemeData(
          color: colors.border,
          thickness: 1,
          space: 1,
        ),
        tooltipTheme: TooltipThemeData(
          preferBelow: true,
          showDuration: const Duration(seconds: 2),
          textStyle: typographies.caption2.withColor(colors.hint),
          decoration: BoxDecoration(
            color: colors.background,
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                color: colors.backgroundDark,
                offset: Offset.zero,
                blurRadius: 20,
              )
            ],
          ),
        ),
      );

  @override
  AppTheme copyWith({
    String? name,
    AppColors? colors,
    AppTypography? typographies,
    AppStyles? styles,
  }) {
    return AppTheme(
      brightness: brightness,
      name: name ?? this.name,
      colors: colors ?? this.colors,
      typographies: typographies ?? this.typographies,
      styles: styles ?? this.styles,
    );
  }

  @override
  AppTheme lerp(covariant ThemeExtension<AppTheme>? other, double t) {
    if (other is! AppTheme) {
      return this;
    }
    return AppTheme(
      brightness: brightness,
      name: name,
      colors: colors.lerp(other.colors, t),
      typographies: typographies.lerp(other.typographies, t),
      styles: styles,
    );
  }
}
