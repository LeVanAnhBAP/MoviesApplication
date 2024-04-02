import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/exceptions/exception.dart';
import 'package:movies_app/core/extensions/converts/movie.dart';
import 'package:movies_app/data/models/request/user/user_request_params.dart';
import 'package:movies_app/data/usecases/get_list_movies.dart';
import 'package:movies_app/data/usecases/user_use_cases.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetMoviesUseCase getMoviesUseCase;
  final AddMovieToWatchlistUseCase addMovieToWatchlistUseCase;
  final RemoveMovieToWatchlistUseCase removeMovieToWatchlistUseCase;
  final GetWatchlistUseCase getWatchlistUseCase;
  final GetUserUseCase getUserUseCase;

  HomeBloc(this.getMoviesUseCase,
      this.addMovieToWatchlistUseCase,
      this.removeMovieToWatchlistUseCase,
      this.getWatchlistUseCase,
      this.getUserUseCase,) : super(const HomeState()) {
    on<DashboardHomeGetDataStarted>(_onGetDataStated);
    on<GetWatchlistStarted>(_onGetWatchlistStarted);
    on<AddMovieToWatchlistStarted>(_onAddMovieToWatchlistStarted);
    on<RemoveMovieToWatchlistStarted>(_onRemoveMovieToWatchlistStarted);
    on<HomeErrorOccurred>(_onErrorOccurred);
    on<HomeRefreshData>(_onRefreshData);
    on<GetUserStarted>(_onGetUserStarted);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(HomeErrorOccurred(BaseException.from(error)));
    super.onError(error, stackTrace);
  }

  FutureOr<void> _onErrorOccurred(HomeErrorOccurred event,
      Emitter<HomeState> emit,) {
    emit(state.copyWith(
      status: HomeStatus.failure,
      error: event.error,
    ));
  }

  FutureOr<void> _onGetDataStated(DashboardHomeGetDataStarted event,
      Emitter<HomeState> emit,) async {
    try {
      emit(state.copyWith(status: HomeStatus.loading));

      final moviesRes = await getMoviesUseCase();

      emit(
        state.copyWith(movies: moviesRes.toUI(), status: HomeStatus.success),
      );
    } catch (e) {
      emit(state.copyWith(
        status: HomeStatus.failure,
      ));
    }
  }

  FutureOr<void> _onAddMovieToWatchlistStarted(AddMovieToWatchlistStarted event,
      Emitter<HomeState> emit,) async {
    try {
      emit(state.copyWith(status: HomeStatus.loading));
      await addMovieToWatchlistUseCase(event.params);
      emit(
        state.copyWith(
          isAddWatchlist: true,
          status: HomeStatus.success,
        ),
      );
    } catch (e) {
      emit(state.copyWith(
        status: HomeStatus.failure,
      ));
    }
  }

  FutureOr<void> _onRemoveMovieToWatchlistStarted(
      RemoveMovieToWatchlistStarted event,
      Emitter<HomeState> emit,) async {
    try {
      emit(state.copyWith(status: HomeStatus.loading));
      List<String> list = List.from(state.idMovies);
      list.remove(event.idMovie);
      await removeMovieToWatchlistUseCase(WatchlistParams(
        idUser: event.idUser,
        idMovies: list,
      ));
      emit(
        state.copyWith(
          isAddWatchlist: false,
          status: HomeStatus.success,
        ),
      );
    } catch (e) {
      emit(state.copyWith(
        status: HomeStatus.failure,
      ));
    }
  }

  FutureOr<void> _onGetWatchlistStarted(GetWatchlistStarted event,
      Emitter<HomeState> emit,) async {
    try {
      emit(state.copyWith(status: HomeStatus.loading));
      final res = await getWatchlistUseCase(event.idUser);
      bool isAddWatchlist = res.contains(event.idMovie);
      emit(state.copyWith(
        status: HomeStatus.success,
        isAddWatchlist: isAddWatchlist,
        idMovies: res,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: HomeStatus.failure,
      ));
    }
  }

  FutureOr<void> _onRefreshData(HomeRefreshData event,
      Emitter<HomeState> emit) async {
    emit(state.copyWith(status: HomeStatus.refreshing));

    final moviesRes = await getMoviesUseCase();

    emit(state.copyWith(
      movies: moviesRes.toUI(),
      status: HomeStatus.success,
    ));
  }

  Future<void> _onGetUserStarted(GetUserStarted event,
      Emitter<HomeState> emit,) async {
    try {
      emit(state.copyWith(
        status: HomeStatus.loading,
      ));
      final data = await getUserUseCase();
      emit(state.copyWith(
        user: data,
        status: HomeStatus.success,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: HomeStatus.failure,
      ));
    }
  }
}
