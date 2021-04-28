import 'dart:async';
import 'dart:convert';
import '../models/movie_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<Movie>> fetchMovies(http.Client client) async {
  final response = await client.get(Uri.parse(
      'https://raw.githubusercontent.com/syadox66/syadox66.github.io/main/movies.json'));

  // Use the compute function to run parsePhotos in a separate isolate.
  //debugPrint(response.body.toString());
  return compute(parseMovies, response.body);
}

List<Movie> parseMovies(String responseBody) {
  final parsed = jsonDecode(responseBody);
  List<dynamic>.from(parsed);
  debugPrint(parsed.toString());
  return parsed.map<Movie>((json) => Movie.fromJson(json)).toList();
}

Future<List<Movie>> fetchCarousel(http.Client client) async {
  final response = await client.get(Uri.parse(
      'https://raw.githubusercontent.com/syadox66/syadox66.github.io/main/carousel.json'));

  // Use the compute function to run parsePhotos in a separate isolate.
  //debugPrint(response.body.toString());
  return compute(parseCarousel, response.body);
}

List<Movie> parseCarousel(String responseBody) {
  final parsed = jsonDecode(responseBody);
  List<dynamic>.from(parsed);
  debugPrint(parsed.toString());
  return parsed.map<Movie>((json) => Movie.fromJson(json)).toList();
}
