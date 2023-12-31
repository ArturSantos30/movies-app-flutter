import 'package:flutter/material.dart';
import 'package:simplemovieapp/pages/home_page.dart';
import 'package:simplemovieapp/pages/movie_details_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        "/": (context) => const HomePage(),
        "/details": (context) => const MovieDetailsPage(),
      },
    );
  }
}
