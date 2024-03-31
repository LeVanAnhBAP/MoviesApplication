import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:movies_app/core/extensions/theme.dart';
import 'package:movies_app/data/sources/models/movie.dart';
import 'package:movies_app/presentation/widgets/custom_app_bar.dart';
import 'package:movies_app/presentation/widgets/custom_button.dart';
import 'package:movies_app/presentation/widgets/divider_line.dart';

@RoutePage()
class DetailMoviePage extends StatefulWidget {
  const DetailMoviePage({required this.movie});

  final Movie movie;

  @override
  State<DetailMoviePage> createState() => _DetailMoviePageState();
}

class _DetailMoviePageState extends State<DetailMoviePage> {
  late Movie _movie;

  @override
  void initState() {
    _movie = widget.movie;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarTitle: _movie.title,
        titleAlign: TextAlign.start,
        onBackPress: () {
          context.router.pop();
        },
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        _buildPoster(context),
        const SizedBox(
          height: 8,
        ),
        _buildTitleMovie(context),
        const SizedBox(
          height: 8,
        ),
        _buildBasicInfoMovie(context),
        const SizedBox(
          height: 16,
        ),
        _buildStoryLine(context),
        const SizedBox(
          height: 8,
        ),
        _buildGenres(context),
        const SizedBox(
          height: 16,
        ),
        _buildAddToWatchList(context),
        const SizedBox(
          height: 8,
        ),
        const DividerLine(width: double.infinity),
        const SizedBox(
          height: 8,
        ),
        _buildRatings(context),
        const SizedBox(
          height: 8,
        ),
        const DividerLine(width: double.infinity),
        const SizedBox(
          height: 8,
        ),
        _buildActors(context),
      ],
    );
  }

  Widget _buildPoster(BuildContext context) {
    final posterHeight = MediaQuery.of(context).size.height / 3;
    return ClipRRect(
      borderRadius: BorderRadius.circular(0),
      child: Image.network(
        widget.movie.posterUrl,
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) return child;
          return CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes!
                : null,
          );
        },
        width: double.infinity,
        height: posterHeight,
        fit: BoxFit.contain,
        errorBuilder:
            (BuildContext context, Object error, StackTrace? stackTrace) {
          return Container(
            height: posterHeight,
            width: double.infinity,
            color: context.colors.primary,
          );
        },
      ),
    );
  }

  Widget _buildTitleMovie(
    BuildContext context, {
    maxLines = 2,
  }) {
    return Row(
      children: [
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Text(
            _movie.title,
            style: context.typographies.title1.copyWith(color: Colors.black),
            maxLines: maxLines,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
      ],
    );
  }

  Widget _buildBasicInfoMovie(
    BuildContext context, {
    maxLines = 2,
  }) {
    final textStyle = context.typographies.body.copyWith(color: Colors.black87);
    return Row(
      children: [
        const SizedBox(
          width: 8,
        ),
        Text(
          _movie.year,
          style: textStyle,
          maxLines: maxLines,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          _movie.contentRating,
          style: textStyle,
          maxLines: maxLines,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          _movie.duration,
          style: textStyle,
          maxLines: maxLines,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(
          width: 8,
        ),
      ],
    );
  }

  Widget _buildStoryLine(BuildContext context) {
    final textStyle =
        context.typographies.bodyBold.copyWith(color: Colors.black54);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Text(
        _movie.storyline,
        style: textStyle,
        softWrap: true,
        overflow: TextOverflow.fade,
      ),
    );
  }

  Widget _buildGenres(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Wrap(
        spacing: 8.0,
        runSpacing: 16.0,
        children: _movie.genres.map((text) {
          return AppButton.primary(
            style: ButtonDisplayOptions.fix,
            size: ButtonSize.small,
            text,
            isDisable: true,
            onPressed: () {},
          );
        }).toList(),
      ),
    );
  }

  Widget _buildAddToWatchList(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: AppButton(
        textAlign: TextAlign.start,
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        style: ButtonDisplayOptions.fix,
        size: ButtonSize.large,
        '+  Add to Watchlist',
        padding: const EdgeInsets.all(16.0),
        onPressed: () {},
        width: double.infinity,
      ),
    );
  }

  Widget _buildRatings(
    BuildContext context, {
    maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          Icons.star,
          color: Colors.amber,
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          '${_movie.imdbRating.toString()}/10',
          style: context.typographies.caption1.copyWith(color: Colors.black),
          maxLines: maxLines,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _buildActors(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Cast',
            style: context.typographies.title2Bold,
          ),
          const SizedBox(
            height: 16,
          ),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: _movie.actors.map((text) {
              return AppButton.primary(
                style: ButtonDisplayOptions.fix,
                size: ButtonSize.small,
                text,
                isDisable: true,
                onPressed: () {},
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
