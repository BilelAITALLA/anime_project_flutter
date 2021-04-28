import '../models/movie_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper; // Singleton DatabaseHelper
  static Database _database; // Singleton Database

  String movieTable = 'movie_table';
  String colId = 'id';
  String colref = 'ref';
  String colTitle = 'title';
  String colDescription = 'description';
  String colDate = 'year';
  String colEps = 'nbepisodes';
  String colTrailer = 'trailer';
  String colCats = 'categories';
  String colPoster = 'poster';

  DatabaseHelper._createInstance(); // Named constructor to create instance of DatabaseHelper

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper
          ._createInstance(); // This is executed only once, singleton object
    }
    return _databaseHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    // Get the directory path for both Android and iOS to store database.
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'movies.db';

    // Open/create the database at a given path
    var moviesDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return moviesDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $movieTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colTitle TEXT, '
        '$colDescription TEXT, $colDate TEXT, $colEps INTEGER, $colTrailer TEXT, $colCats TEXT, $colPoster TEXT, $colref INTEGER, screenshots TEXT)');
  }

  // Fetch Operation: Get all todo objects from database
  Future<List<Map<String, dynamic>>> getMovieMapList() async {
    Database db = await this.database;

//		var result = await db.rawQuery('SELECT * FROM $todoTable order by $colTitle ASC');
    var result = await db.query(movieTable, orderBy: '$colTitle ASC');
    debugPrint(result.toString());
    return result;
  }

  // Insert Operation: Insert a todo object to database
  Future<int> insertMovie(Movie movie) async {
    Database db = await this.database;
    var list = await db.query(movieTable, orderBy: '$colTitle ASC');
    var titlelist = [];
    for (var i = 0; i < list.length; i++) {
      var title = list[i]["title"];
      titlelist.add(title);
    }
    debugPrint(list.toString());
    if (titlelist.contains(movie.title)) {
      deleteMovie(movie.id);
      debugPrint('Movie already in List');
    } else {
      var result = await db.insert(movieTable, movie.toMap());
      return result;
    }
  }

  // Update Operation: Update a todo object and save it to database
  Future<int> updateMovie(Movie movie) async {
    var db = await this.database;
    var result = await db.update(movieTable, movie.toMap(),
        where: 'ref = ?', whereArgs: [movie.ref]);
    return result;
  }

  // Delete Operation: Delete a todo object from database
  Future<int> deleteMovie(int id) async {
    var db = await this.database;
    int result = await db.rawDelete('DELETE FROM $movieTable WHERE ref = $id');
    return result;
  }

  // Get number of todo objects in database
  Future<int> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (*) from $movieTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  // Get the 'Map List' [ List<Map> ] and convert it to 'todo List' [ List<Todo> ]
  Future<List<Movie>> getMovieList() async {
    var movieMapList = await getMovieMapList(); // Get 'Map List' from database
    int count =
        movieMapList.length; // Count the number of map entries in db table

    List<Movie> movieList = [];
    // For loop to create a 'todo List' from a 'Map List'
    for (int i = 0; i < count; i++) {
      movieList.add(Movie.fromMapObject(movieMapList[i]));
    }
    return movieList;
  }
}
