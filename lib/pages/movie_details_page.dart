import 'package:flutter/material.dart';

import '../models/movie_model.dart';

class MovieDetailsPage extends StatelessWidget {
  const MovieDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {

    final movie = ModalRoute.of(context)!.settings.arguments as Movie;

    Widget loadBackdropImage(String? backdropPath){
      if (backdropPath != null){
        return Image.network(
          'https://image.tmdb.org/t/p/original$backdropPath',
          fit: BoxFit.cover,
          height: double.infinity,
        );
      }
      return Center(
          child: Image.asset('assets/not_found.png',color: Colors.white,)
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie Details"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 250,
            child: loadBackdropImage(movie.backdropPath),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
            child: Text(movie.title,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text("Rate: ${movie.voteAverage} / 10"),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 10),
            child: Text("Year: ${DateTime.parse(movie.releaseDate.toString()).year}"),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "Storyline",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Text("${movie.overview}"),
          ),
        ],
      ),
    );
  }
}
