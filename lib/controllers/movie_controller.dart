
import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/movie_model.dart';
import '../services/movies_api.dart';

class MovieController {

  final MoviesAPI api;

  MovieController(this.api){
    getMovies();
  }

  ValueNotifier<List<Movie>> movies = ValueNotifier([]);

  getMovies() async {
    var result = await api.fetchMoviesList();
    movies.value = List.from(result).map((e) => Movie.fromJson(e)).toList();
  }
}