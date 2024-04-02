class UserRequestParams {
  final String email;
  final String password;

  UserRequestParams({required this.email, required this.password});
}

class WatchlistParams {
  final String idUser;
  final List<String> idMovies;

  WatchlistParams({required this.idUser, required this.idMovies});
}

class MovieFirebaseParams {
  final String idUser;
  final String idMovie;

  MovieFirebaseParams({required this.idUser, required this.idMovie});
}
