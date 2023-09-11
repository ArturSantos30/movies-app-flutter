import 'dart:convert';

import 'package:http/http.dart' as http;

import '../env/env.dart';
import '../utils/api_constants.dart';
import 'movies_api.dart';

class HttpService implements MoviesAPI{
  final String authToken = Env.tmdbKey;

  @override
  Future<List<dynamic>> fetchMoviesList() async {
    final response = await http.get(
      Uri.parse(APIConstants.popularMoviesUrl),
      headers: {
        'Content-Type': APIConstants.contentType,
        'Authorization': authToken,
      },
    );
    var listMoviesResult = jsonDecode(response.body)["results"];
    return listMoviesResult;
  }

  @override
  Future<List<dynamic>> searchMovies(String query) async {
    final response = await http.get(
      Uri.parse(APIConstants.searchMoviesUrl).replace(
          queryParameters: {'query': query,}),
      headers: {
        'Content-Type': APIConstants.contentType,
        'Authorization': authToken,
      },
    );
    var listMoviesResult = jsonDecode(response.body)["results"];
    return listMoviesResult;
  }
}