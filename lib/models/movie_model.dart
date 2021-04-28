import 'dart:convert';

class Movie {
  int ref;
  String poster;
  int nbepisodes;
  String title;
  String description;
  String year;
  String categories;
  String trailer;
  String screenshots;

  Movie(
      {this.ref,
      this.poster,
      this.nbepisodes,
      this.title,
      this.description,
      this.year,
      this.categories,
      this.trailer,
      this.screenshots});

  factory Movie.fromJson(Map<String, dynamic> jsonfile) {
    return Movie(
        ref: jsonfile["id"] as int,
        poster: jsonfile['poster'] as String,
        nbepisodes: jsonfile['episodes'] as int,
        title: jsonfile['title'] as String,
        description: jsonfile['description'] as String,
        year: jsonfile['year'].toString(),
        categories: jsonfile['categories'] as String,
        trailer: jsonfile['trailer'] as String,
        screenshots: jsonfile['screenshots'].join("@"));
  }

  Movie.fromMapObject(Map<String, dynamic> map) {
    this.poster = map["poster"];
    this.title = map["title"];
    this.categories = map["categories"];
    this.year = map["year"];
    this.nbepisodes = map["nbepisodes"];
    this.description = map["description"];
    this.trailer = map["trailer"];
    this.ref = map["ref"];
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (ref != null) {
      map['ref'] = ref;
    }
    map["poster"] = poster;
    map["title"] = title;
    map["categories"] = categories;
    map["year"] = year;
    map["nbepisodes"] = nbepisodes;
    map["description"] = description;
    map["trailer"] = trailer;

    return map;
  }

  int get id => ref;

  String get _title => title;

  String get _description => description;

  String get date => year;
}

final List<String> labels = [
  'Discover',
  'Categories',
  'Specials',
  'New',
];
