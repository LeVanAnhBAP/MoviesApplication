import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/data/sources/models/movie.dart';

import 'home_bloc.dart';
import 'home_state.dart';

class HomeStatusSelector extends BlocSelector<HomeBloc, HomeState, HomeStatus> {
  HomeStatusSelector({
    super.key,
    required Widget Function(HomeStatus data) builder,
  }) : super(
          selector: (state) => state.status,
          builder: (_, status) => builder(status),
        );
}

class HomeStatusListener extends BlocListener<HomeBloc, HomeState> {
  HomeStatusListener({
    required Iterable<HomeStatus> statuses,
    super.key,
    required super.listener,
  }) : super(
          listenWhen: (previousState, currentState) =>
              previousState.status != currentState.status &&
              statuses.contains(currentState.status),
        );
}

class MoviesSelector extends BlocSelector<HomeBloc, HomeState, List<Movie>> {
  MoviesSelector({
    required Widget Function(List<Movie> movies) builder,
  }) : super(
          selector: (state) => state.movies,
          builder: (_, status) => builder(status),
        );
}
