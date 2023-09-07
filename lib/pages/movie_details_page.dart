import 'package:flutter/material.dart';
import 'package:simplemovieapp/widgets/release_year_chip_custom_widget.dart';

import '../models/movie_model.dart';
import '../widgets/average_vote_custom_widget.dart';
import '../widgets/backdrop_image_custom_widget.dart';

class MovieDetailsPage extends StatelessWidget {
  const MovieDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {

    final movie = ModalRoute.of(context)!.settings.arguments as Movie;

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
            child: BackdropImageCustomWidget(backdropPath: movie.backdropPath),
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
            padding: const EdgeInsets.only(left: 20, bottom: 10,right: 20),
            child: Row(
              children: [
                AverageVoteCustomWidget(voteAverage: movie.voteAverage),
                const Spacer(),
                ReleaseYearChipCustomWidget(releaseDate: movie.releaseDate,)
              ],
            )
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
