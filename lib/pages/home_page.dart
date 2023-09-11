import 'package:flutter/material.dart';
import 'package:simplemovieapp/component/textfield_custom_component.dart';
import 'package:simplemovieapp/services/http_service.dart';

import '../controllers/movie_controller.dart';
import '../models/movie_model.dart';
import '../widgets/poster_image_custom_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MovieController _controller = MovieController(HttpService());
  final TextEditingController _textEditingController = TextEditingController();

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
            child: TextFieldCustomComponent(
              controller: _controller,
              textEditingController: _textEditingController,
            ),
          ),
        ),
      ),
      body: ValueListenableBuilder<List<Movie>>(
        valueListenable: _controller.movies,
        builder: (_, movies, __) {
          if (movies.isNotEmpty) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: movies.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(movies[index].title),
                  subtitle: Text('Rating: ${movies[index].voteAverage}'),
                  leading: PosterImageCustomWidget(
                    posterPath: movies[index].posterPath,
                  ),
                  onTap: () => Navigator.of(context)
                      .pushNamed('/details', arguments: movies[index]),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}