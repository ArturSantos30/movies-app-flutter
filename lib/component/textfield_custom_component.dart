import 'package:flutter/material.dart';

import '../controllers/movie_controller.dart';

class TextFieldCustomComponent extends StatefulWidget {
  final MovieController controller;
  final TextEditingController textEditingController;

  const TextFieldCustomComponent({
    super.key,
    required this.controller,
    required this.textEditingController
  });

  @override
  State<TextFieldCustomComponent> createState() => _TextFieldCustomComponentState();
}

class _TextFieldCustomComponentState extends State<TextFieldCustomComponent> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.textEditingController,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(16),
          hintText: "Search for a movie",
          prefixIcon: const Icon(Icons.search),
          suffixIcon: widget.textEditingController.text.isNotEmpty?
          IconButton(
            onPressed: (){
              widget.textEditingController.clear();
              setState(() {
                widget.controller.getMovies();
              });
            },
            icon: const Icon(Icons.clear),
          ) : null,
          filled: true,
          fillColor: Colors.white12,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          )
      ),
      onSubmitted: (value) {
        if (value.isNotEmpty) {
          widget.controller.searchMovies(value);
        }
      },
      onChanged: (value) {
        if (value.isEmpty) {
          widget.controller.getMovies();
        } else {
          setState(() {});
        }
      },
    );
  }
}
