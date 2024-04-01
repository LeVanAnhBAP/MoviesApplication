import 'dart:async';

import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/data/sources/models/movie.dart';
import 'package:movies_app/di/injector.dart';
import 'package:movies_app/presentation/navigation/navigation.dart';
import 'package:movies_app/presentation/widgets/custom_app_bar.dart';
import 'package:movies_app/presentation/widgets/divider_line.dart';
import 'package:movies_app/presentation/widgets/item_movie.dart';

import 'home_bloc.dart';
import 'home_event.dart';
import 'home_selector.dart';

@RoutePage()
class DashboardHomePage extends StatefulWidget {
  const DashboardHomePage({super.key});

  @override
  State<DashboardHomePage> createState() => _DashboardHomePageState();
}

class _DashboardHomePageState extends State<DashboardHomePage> {
  final HomeBloc _bloc = provider.get<HomeBloc>();

  @override
  void initState() {
    scheduleMicrotask(() {
      _bloc.add(const DashboardHomeGetDataStarted());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: Scaffold(
        appBar: CustomAppBar(
          titleAlign: TextAlign.center,
          onSearchValue: (value) {},
        ),
        body: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return MoviesSelector(
      builder: (movies) {
        return ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.all(8),
          itemCount: movies.length,
          itemBuilder: (BuildContext context, int index) {
            Movie movie = movies[index];
            return Column(
              children: [
                const DividerLine(width: double.infinity),
                InkWell(
                  onTap: () {
                    context.router.push(
                      DetailMovieRoute(movie: movie),
                    );
                  },
                  child: ItemMovie(movie: movie),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
