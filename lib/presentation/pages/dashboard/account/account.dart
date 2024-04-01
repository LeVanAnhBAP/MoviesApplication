import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/extensions/theme.dart';
import 'package:movies_app/data/sources/models/movie.dart';
import 'package:movies_app/di/injector.dart';
import 'package:movies_app/presentation/navigation/navigation.dart';
import 'package:movies_app/presentation/widgets/custom_button.dart';
import 'package:movies_app/presentation/widgets/divider_line.dart';
import 'package:movies_app/presentation/widgets/item_movie.dart';

import 'account_bloc.dart';

@RoutePage()
class DashboardAccountPage extends StatefulWidget {
  @override
  State<DashboardAccountPage> createState() => _DashboardAccountPageState();
}

class _DashboardAccountPageState extends State<DashboardAccountPage> {
  final AccountBloc _bloc = provider.get<AccountBloc>();

  @override
  void dispose() {
    _bloc.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: context.colors.backgroundAppbar,
        ),
        body: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return _buildAccount();
  }

  Widget _buildNotAccount(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.only(top: 56, bottom: 32, left: 8, right: 8),
      children: [
        _buildNotice(context),
        const SizedBox(
          height: 8,
        ),
        _buildSignInOrSignUp()
      ],
    );
  }

  Widget _buildNotice(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(
        'Get and keep Watchlist',
        style: context.typographies.bodyBold,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildSignInOrSignUp() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: AppButton(
        textAlign: TextAlign.center,
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        style: ButtonDisplayOptions.fix,
        size: ButtonSize.large,
        'Sign in / Sign up',
        padding: const EdgeInsets.all(16.0),
        onPressed: () {
          context.router.push(const LoginRoute());
        },
        width: double.infinity,
      ),
    );
  }

  Widget _buildAccount() {
    return ListView(
      shrinkWrap: true,
      children: [
        _buildInfoAccount(context),
        const SizedBox(
          height: 8,
        ),
        _buildWatchlist(context),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildInfoAccount(BuildContext context) {
    final infoAccountHeight = MediaQuery.of(context).size.height / 4;
    return Container(
      height: infoAccountHeight,
      color: context.colors.backgroundAppbar,
      alignment: Alignment.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            width: 16,
          ),
          Expanded(
            flex: 3,
            child: _buildNameAndEmail(context),
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 1,
            child: _buildAvatar(context),
          ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }

  Widget _buildNameAndEmail(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Anh',
          style: context.typographies.title2Bold,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          'anhxtanh141199121218@gmail.com',
          style: context.typographies.caption1,
        ),
      ],
    );
  }

  Widget _buildAvatar(BuildContext context) {
    return CircleAvatar(
      radius: 15,
      backgroundColor: Colors.white,
      child: Text(
        'A',
        style: context.typographies.title1SemiBold,
      ),
    );
  }

  Widget _buildWatchlist(BuildContext context) {
    return Column(
      children: [_buildTitleWatchlist(context), _buildListWatchlist(context)],
    );
  }

  Widget _buildTitleWatchlist(BuildContext context) {
    final height = context.typographies.title3Bold.fontSize! + 3.0;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        children: [
          Container(
            width: 4,
            height: height,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            'Watchlist',
            style: context.typographies.title3Bold,
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            '0',
            style: context.typographies.caption1,
          )
        ],
      ),
    );
  }

  Widget _buildListWatchlist(BuildContext context) {
    List<Movie> movies = Movie.generateMovies();

    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(8),
      itemCount: movies.length,
      itemBuilder: (BuildContext context, int index) {
        final movie = movies[index];
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
  }
}
