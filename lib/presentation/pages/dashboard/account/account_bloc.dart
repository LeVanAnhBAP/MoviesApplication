import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/extensions/converts/movie.dart';
import 'package:movies_app/data/usecases/get_list_movies.dart';
import 'package:movies_app/data/usecases/user_use_cases.dart';

import 'account_event.dart';
import 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  final GetIsSignedInUseCase getIsSignedInUseCase;
  final GetUserUseCase getUserUseCase;
  final GetWatchlistUseCase getWatchlistUseCase;
  final GetMoviesUseCase getMoviesUseCase;
  final SignOutUseCase signOutUseCase;

  AccountBloc(this.getIsSignedInUseCase, this.getUserUseCase,
      this.getWatchlistUseCase, this.getMoviesUseCase, this.signOutUseCase)
      : super(const AccountState()) {
    on<AccountErrorOccurred>(_onErrorOccurred);
    on<IsSignInCheck>(_onIsSignInCheck);
    on<GetUserStarted>(_onGetUserStarted);
    on<GetWatchlistStarted>(_onGetWatchlistStarted);
    on<SignOutStarted>(_onSignOutStarted);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
  }

  FutureOr<void> _onErrorOccurred(
    AccountErrorOccurred event,
    Emitter<AccountState> emit,
  ) {
    emit(state.copyWith(status: AccountStatus.failure, error: event.error));
  }

  Future<void> _onIsSignInCheck(
    IsSignInCheck event,
    Emitter<AccountState> emit,
  ) async {
    try {
      emit(state.copyWith(
        status: AccountStatus.loading,
      ));
      final user = await getUserUseCase();
      emit(state.copyWith(
        user: user,
        isSignIn: user != null,
        status: AccountStatus.success,
      ));

      if (user != null) {
        final moviesRes = await getMoviesUseCase();
        final watchListId = await getWatchlistUseCase(user.uid);

        final movies = moviesRes
            .toUI()
            .where((movie) => watchListId.contains(movie.id))
            .toList();
        emit(state.copyWith(
          movies: movies,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        status: AccountStatus.failure,
      ));
    }
  }

  Future<void> _onGetUserStarted(
    GetUserStarted event,
    Emitter<AccountState> emit,
  ) async {
    try {
      emit(state.copyWith(
        status: AccountStatus.loading,
      ));
      final data = await getUserUseCase();
      emit(state.copyWith(
        user: data,
        status: AccountStatus.success,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: AccountStatus.failure,
      ));
    }
  }

  FutureOr<void> _onGetWatchlistStarted(
    GetWatchlistStarted event,
    Emitter<AccountState> emit,
  ) async {
    try {
      emit(state.copyWith(status: AccountStatus.loading));
      final moviesRes = await getMoviesUseCase();
      final watchListId = await getWatchlistUseCase(event.idUser);

      final movies = moviesRes
          .toUI()
          .where((movie) => watchListId.contains(movie.id))
          .toList();
      emit(state.copyWith(
        status: AccountStatus.success,
        movies: movies,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: AccountStatus.failure,
      ));
    }
  }

  FutureOr<void> _onSignOutStarted(
    SignOutStarted event,
    Emitter<AccountState> emit,
  ) async {
    try {
      emit(state.copyWith(status: AccountStatus.loading));
      await signOutUseCase();
      emit(state.copyWith(
        status: AccountStatus.success,
        movies: [],
        user: null,
        isSignIn: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: AccountStatus.failure,
      ));
    }
  }
}
