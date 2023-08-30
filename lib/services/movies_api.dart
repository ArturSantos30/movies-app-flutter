import 'dart:convert';

import 'package:http/http.dart' as http;

class MoviesAPI{
  final String baseUrl = 'https://api.themoviedb.org/3';
  final String authToken = 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQi'
      'OiI3NGRlYzkzOGRlY2FkY2ZjODllYmU3NzkyMTY5Y2JkOSIsInN1YiI6IjY0ZTIxOTg5ZTE5'
      'ZGU5MDExZDVlZGRhNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Ug3jq'
      'vCJzGLTzAgIw-pM3uxjgJ5I6KDUwW_urOSBeM0';

  Future<List<dynamic>> fetchMoviesList() async {
    final response = await http.get(
      Uri.parse('$baseUrl/movie/popular'),
      headers: {
        'Content-Type': 'application/json;charset=utf-8',
        'Authorization': authToken,
      },
    );
    return jsonDecode(response.body)["results"];
  }

  Future<List<dynamic>> searchMovies(String query) async {
    final response = await http.get(
      Uri.parse('$baseUrl/search/movie').replace(
          queryParameters: {'query': query,}),
      headers: {
        'Content-Type': 'application/json;charset=utf-8',
        'Authorization': authToken,
      },
    );
    return jsonDecode(response.body)["results"];
  }
}