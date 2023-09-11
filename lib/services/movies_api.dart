import 'dart:convert';

import 'package:http/http.dart' as http;

import '../env/env.dart';

class MoviesAPI{
  final String baseUrl = 'https://api.themoviedb.org/3';
  final String authToken = Env.tmdbKey;

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