import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'account_event.dart';
import 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc() : super(const AccountState()) {
    on<AccountErrorOccurred>(_onErrorOccurred);
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
}
