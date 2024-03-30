import 'package:movies_app/env.dart';
import 'package:movies_app/data/services/auth/auth.services.dart';
import 'package:movies_app/data/services/api/api.service.dart';
import 'package:movies_app/di/injector.dart';
import 'dart:async';

FutureOr<void> registerServices() async {
  provider.registerSingleton<ApiServices>(
    ApiServices(
      baseUrl: AppEnv.baseUrl,
      authRepository: provider.get<AuthServices>(),
    ),
  );
}
