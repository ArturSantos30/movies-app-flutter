abstract class MoviesAPI{
  Future<List<dynamic>> fetchMoviesList();
  Future<List<dynamic>> searchMovies(String query);
}