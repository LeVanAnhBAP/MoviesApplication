import 'package:flutter/material.dart';
import 'package:movies_app/core/extensions/theme.dart';
import 'package:movies_app/data/sources/models/movie.dart';

class ItemMovie extends StatelessWidget {
  final Movie movie;
  final EdgeInsetsGeometry padding;

  final double width;

  final Color backgroundColor;
  final Color borderColor;

  final TextStyle? styleTitle;
  final TextStyle? styleContent;

  final double widthImage;
  final double heightImage;
  final double radiusImage;

  const ItemMovie({
    super.key,
    this.backgroundColor = Colors.white,
    this.borderColor = const Color(0xFFEFEEFC),
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
    this.width = double.infinity,
    required this.movie,
    this.styleTitle,
    this.styleContent,
    this.radiusImage = 10,
    this.widthImage = 80,
    this.heightImage = 80,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildPoster(context),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: _buildInfo(context),
          ),
        ],
      ),
    );
  }

  Widget _buildPoster(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radiusImage),
      child: Image.network(
        movie.posterUrl,
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
        width: widthImage,
        height: heightImage,
        fit: BoxFit.cover,
        errorBuilder:
            (BuildContext context, Object error, StackTrace? stackTrace) {
          return Container(
            height: heightImage,
            width: widthImage,
            color: context.colors.primary,
          );
        },
      ),
    );
  }

  Widget _buildInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitleMovie(context),
        const SizedBox(
          height: 4,
        ),
        _buildRatingMovie(context),
      ],
    );
  }

  Widget _buildTitleMovie(
    BuildContext context, {
    maxLines = 2,
  }) {
    return Row(
      children: [
        const SizedBox(
          width: 2,
        ),
        Expanded(
          child: Text(
            movie.title,
            style: styleTitle ??
                context.typographies.title3Bold.copyWith(color: Colors.black),
            maxLines: maxLines,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildRatingMovie(
    BuildContext context, {
    maxLines = 2,
  }) {
    return Row(
      children: [
        const Icon(
          Icons.star,
          color: Colors.amber,
        ),
        const SizedBox(
          width: 4,
        ),
        Expanded(
          child: Text(
            movie.imdbRating.toString(),
            style: styleContent ??
                context.typographies.caption1.copyWith(color: Colors.black),
            maxLines: maxLines,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
