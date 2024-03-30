import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:movies_app/core/extensions/theme.dart';
import 'package:movies_app/presentation/blocs/bloc_observer.dart';
import 'package:movies_app/presentation/navigation/navigation.dart';

import 'env.dart';
import 'core/languages/languages.dart';
import 'di/injector.dart';
import 'presentation/blocs/global_bloc_providers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();

  await injectDependencies();

  Bloc.observer = const AppBlocObserver();

  runApp(
    GlobalBlocProviders(
      child: AppLanguages(
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: AppEnv.appName,
      theme: ThemeData(
        scaffoldBackgroundColor: context.colors.background,
      ),
      supportedLocales: context.supportedLocales,
      localizationsDelegates: [...context.localizationDelegates],
      routerConfig: _appRouter.config(
        navigatorObservers: () => [AutoRouteObserver()],
      ),
    );
  }
}
