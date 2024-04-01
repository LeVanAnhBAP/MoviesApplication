import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/data/usecases/user_use_cases.dart';

import 'account_event.dart';
import 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  final GetIsSignedInUseCase getIsSignedInUseCase;
  final GetUserUseCase getUserUseCase;

  AccountBloc(this.getIsSignedInUseCase, this.getUserUseCase)
      : super(const AccountState()) {
    on<AccountErrorOccurred>(_onErrorOccurred);
    on<IsSignInCheck>(_onIsSignInCheck);
    on<GetUserStarted>(_onGetUserStarted);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
  }

  FutureOr<void> _onErrorOccurred(
    AccountErrorOccurred event,
    Emitter<AccountState> emit,
  ) {
    emit(state.copyWith(
      status: AccountStatus.failure,
    ));
  }

  Future<void> _onIsSignInCheck(
    IsSignInCheck event,
    Emitter<AccountState> emit,
  ) async {
    emit(state.copyWith(
      status: AccountStatus.loading,
    ));
    final data = await getIsSignedInUseCase();
    if (data == true) {
      final user = await getUserUseCase();
      emit(state.copyWith(
        user: user,
      ));
    }
    emit(state.copyWith(
      isSignIn: data,
      status: AccountStatus.success,
    ));
  }

  Future<void> _onGetUserStarted(
    GetUserStarted event,
    Emitter<AccountState> emit,
  ) async {
    emit(state.copyWith(
      status: AccountStatus.loading,
    ));
    final data = await getUserUseCase();
    emit(state.copyWith(
      user: data,
      status: AccountStatus.success,
    ));
  }
}
