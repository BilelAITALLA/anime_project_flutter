import 'package:flutter/material.dart';
import 'package:netflix/JSON/json_helper.dart';
import 'package:netflix/SQL/database_helper.dart';
import 'package:netflix/models/movie_model.dart';
import 'package:netflix/screens/home_screen.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

void main() async {
  DatabaseHelper helper = DatabaseHelper();
  WidgetsFlutterBinding.ensureInitialized();
  List<Movie> movie = await fetchMovies(http.Client());
  List<Movie> carousel = await fetchCarousel(http.Client());
  List<Movie> tablemovies = await helper.getMovieList();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]).then((_) {
    runApp(MyApp(
      movies: movie,
      carousel: carousel,
      list: tablemovies,
    ));
  });
}

class MyApp extends StatefulWidget {
  final List<Movie> movies;
  final List<Movie> carousel;
  final List<Movie> list;
  MyApp({this.movies, this.carousel, this.list});
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ANIMEX',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(
        movielist: widget.movies,
        carousel: widget.carousel,
        list: widget.list,
      ),
    );
  }
}
