import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AppLanguage {
  final Locale locale;
  final String name;

  const AppLanguage({
    required this.locale,
    required this.name,
  });
}

class AppLanguages extends StatelessWidget {
  static const String translationsPath = 'lib/core/languages/translations';

  static final List<AppLanguage> supportedLanguages = [
    const AppLanguage(
      locale: Locale('en'),
      name: 'English',
    ),
  ];

  static final List<Locale> supportedLocales =
      supportedLanguages.map((e) => e.locale).toList();

  static final AppLanguage fallbackLanguage = supportedLanguages.first;

  static Locale get deviceLocale {
    final supportedLanguageCodes =
        supportedLanguages.map((e) => e.locale.languageCode);
    final languageCode = Platform.localeName.split('_').firstWhere(
          (element) => supportedLanguageCodes.contains(element),
          orElse: () => fallbackLanguage.locale.languageCode,
        );

    return Locale(languageCode);
  }

  static AppLanguage parseLanguage(String? languageCode) {
    return supportedLanguages.firstWhere(
      (element) => element.locale.languageCode == languageCode,
      orElse: () => supportedLanguages.first,
    );
  }

  final Widget child;

  const AppLanguages({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      path: translationsPath,
      supportedLocales: supportedLocales,
      fallbackLocale: fallbackLanguage.locale,
      saveLocale: true,
      startLocale: deviceLocale,
      child: child,
    );
  }
}
