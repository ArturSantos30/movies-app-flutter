import 'package:flutter/material.dart';
import 'package:simplemovieapp/services/movies_api.dart';

import '../controllers/movie_controller.dart';
import '../models/movie_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final MovieController _controller = MovieController(MoviesAPI());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movies"),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 25
        ),
        backgroundColor: Colors.deepPurple[300],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(16),
                hintText: "Search for a movie",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                )
              ),
            ),
          ),
        ),
      ),

      body: ValueListenableBuilder<List<Movie>>(
        valueListenable: _controller.movies,
        builder: (_, movies, __) {
          return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index){
              return ListTile(
                title: Text(movies[index].title),
                subtitle: Text('Rate: ${movies[index].voteAverage}'),
                leading: SizedBox(
                  height: 300.0,
                  width: 50.0,
                  child: Image.network('https://image.tmdb.org/t/p/original${movies[index].posterPath}'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}