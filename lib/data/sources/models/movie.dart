class Movie {
  final String id;
  final String title;
  final String year;
  final List<String> genres;
  final List<int> ratings;
  final String poster;
  final String contentRating;
  final String duration;
  final String releaseDate;
  final int averageRating;
  final String originalTitle;
  final String storyline;
  final List<String> actors;
  final double imdbRating;
  final String posterUrl;

  Movie({
    required this.id,
    required this.title,
    required this.year,
    required this.genres,
    required this.ratings,
    required this.poster,
    required this.contentRating,
    required this.duration,
    required this.releaseDate,
    required this.averageRating,
    required this.originalTitle,
    required this.storyline,
    required this.actors,
    required this.imdbRating,
    required this.posterUrl,
  });

  static List<Movie> generateMovies() {
    return [
      Movie(
        id: '1',
        title: 'Game Night',
        year: '2018',
        genres: ['Action', 'Comedy', 'Crime'],
        ratings: [
          2,
          10,
          1,
          10,
          6,
          2,
          5,
          2,
          9,
          7,
          5,
          3,
          7,
          7,
          1,
          4,
          5,
          9,
          2,
          8,
          10,
          8,
          1,
          10,
          7,
          10,
          8,
          6,
          7,
          6
        ],
        poster: 'poster_image_url',
        contentRating: 'PG',
        duration: 'PT100M',
        releaseDate: '2018-02-28',
        averageRating: 0,
        originalTitle: '',
        storyline:
            'A group of friends who meet regularly for game nights find themselves trying to solve a murder mystery.',
        actors: ['Rachel McAdams', 'Jesse Plemons', 'Jason Bateman'],
        imdbRating: 0.0,
        posterUrl: 'poster_image_url',
      ),
      Movie(
        id: '2',
        title: 'Area X: Annihilation',
        year: '2018',
        genres: ['Adventure', 'Drama', 'Fantasy'],
        ratings: [
          2,
          6,
          2,
          3,
          9,
          5,
          3,
          10,
          6,
          7,
          3,
          1,
          6,
          6,
          1,
          7,
          8,
          8,
          7,
          2,
          3,
          2,
          10,
          4,
          9,
          8,
          2,
          2,
          6,
          3
        ],
        poster: 'poster_image_url',
        contentRating: 'R',
        duration: '',
        releaseDate: '2018-02-23',
        averageRating: 0,
        originalTitle: 'Annihilation',
        storyline:
            'A biologist\'s husband disappears. She puts her name forward for an expedition into an environmental disaster zone, but does not find what she\'s expecting. The expedition team is made up of the biologist, an anthropologist, a psychologist, a surveyor, and a linguist.',
        actors: ['Tessa Thompson', 'Jennifer Jason Leigh', 'Natalie Portman'],
        imdbRating: 0.0,
        posterUrl: 'poster_image_url',
      ),
    ];
  }
}
