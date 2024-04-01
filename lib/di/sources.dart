import 'package:firebase_auth/firebase_auth.dart';
import 'package:movies_app/data/services/api/api.service.dart';
import 'package:movies_app/data/sources/network/network.dart';
import 'package:movies_app/di/injector.dart';
import 'dart:async';

FutureOr<void> registerDataSources() async {
  provider.registerSingleton<NetworkDataSource>(
    NetworkDataSource(
      provider.get<ApiServices>(),
    ),
  );

  provider.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
}
