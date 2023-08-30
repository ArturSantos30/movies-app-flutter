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
  final TextEditingController _textEditingController = TextEditingController();
  
  Widget loadPosterImage(String? posterPath){
    if (posterPath != null){
      return Image.network('https://image.tmdb.org/t/p/original$posterPath');
    }
    return Image.asset('assets/not_found.png',color: Colors.white,);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movies"),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          fontSize: 25,
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(16),
                hintText: "Search for a movie",
                suffixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white12,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                )
              ),
              onSubmitted: (value){
                if (value.isNotEmpty){
                  _controller.searchMovies(value);
                }
              },
              onChanged: (value) {
                if (value.isEmpty){
                  _controller.getMovies();
                }
              } ,
            ),
          ),
        ),
      ),

      body: ValueListenableBuilder<List<Movie>>(
        valueListenable: _controller.movies,
        builder: (_, movies, __) {
          if (movies.isNotEmpty){
            return ListView.builder(
              shrinkWrap: true,
              itemCount: movies.length,
              itemBuilder: (context, index){
                return ListTile(
                  title: Text(movies[index].title),
                  subtitle: Text('Rate: ${movies[index].voteAverage}'),
                  leading: SizedBox(
                    height: 100.0,
                    width: 50.0,
                    child: loadPosterImage(movies[index].posterPath),
                  ),
                  onTap: () => Navigator.of(context).pushNamed(
                    '/details',
                    arguments: movies[index]
                  ),
                );
              },
            );
          }
          else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}