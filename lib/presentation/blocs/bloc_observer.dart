import 'package:dio/dio.dart';
import 'package:movies_app/core/exceptions/exception.dart';
import 'package:movies_app/core/exceptions/unauthorized_exception.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    final actualError = error is BaseException ? error.data : error;

    if (error is UnauthorizedException ||
        (actualError is DioException &&
            actualError.response?.statusCode == 401)) {}

    super.onError(bloc, error, stackTrace);
  }
}
