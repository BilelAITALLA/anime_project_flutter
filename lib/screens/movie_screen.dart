import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/SQL/database_helper.dart';
import 'package:netflix/models/movie_model.dart';
import 'package:netflix/screens/home_screen.dart';
import 'package:netflix/screens/movie_player.dart';
import 'package:netflix/widgets/circular_clipper.dart';
import 'package:netflix/widgets/content_scroll.dart';

class MovieScreen extends StatefulWidget {
  final Movie movie;
  final List<Movie> list;
  final List<Movie> movielist;
  final List<Movie> carousel;

  MovieScreen({this.movie, this.list, this.carousel, this.movielist});

  @override
  _MovieScreenState createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  DatabaseHelper helper = DatabaseHelper();
  Future<bool> _onWillPop() async {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    bool check = widget.list.contains(widget.movie);
    return new WillPopScope(
        onWillPop: _onWillPop,
        child: new Scaffold(
          backgroundColor: Colors.white,
          body: ListView(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    transform: Matrix4.translationValues(0.0, -50.0, 0.0),
                    child: Hero(
                      tag: widget.movie.poster,
                      child: ClipShadowPath(
                          clipper: CircularClipper(),
                          shadow: Shadow(blurRadius: 20.0),
                          child: Image(
                            height: 400.0,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            image: NetworkImage(widget.movie.poster),
                          )),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        padding: EdgeInsets.only(left: 30.0),
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(Icons.arrow_back),
                        iconSize: 30.0,
                        color: Colors.black,
                      ),
                      Image(
                        image: AssetImage('images/netflix_logo.png'),
                        height: 60.0,
                        width: 150.0,
                      ),
                    ],
                  ),
                  Positioned.fill(
                    bottom: 10.0,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: RawMaterialButton(
                        padding: EdgeInsets.all(10.0),
                        elevation: 12.0,
                        onPressed: () => print('Play Video'),
                        shape: CircleBorder(),
                        fillColor: Colors.white,
                        child: IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(Icons.play_arrow),
                          iconSize: 60.0,
                          color: Colors.deepOrangeAccent[400],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0.0,
                    left: 25.0,
                    child: IconButton(
                      onPressed: () {
                        if (widget.list.length == 0) {
                          check = false;
                          helper.insertMovie(widget.movie);
                        } else {
                          if (widget.list.contains(widget.movie)) {
                            helper.deleteMovie(widget.movie.id);
                            check = true;
                          } else {
                            check = false;
                            helper.insertMovie(widget.movie);
                          }
                        }
                      },
                      icon: Icon(check ? Icons.check : Icons.add),
                      iconSize: 35.0,
                    ),
                  ),
                  Positioned(
                    bottom: 0.0,
                    right: 25.0,
                    child: IconButton(
                      onPressed: () => print('Download'),
                      icon: Icon(Icons.file_download),
                      iconSize: 35.0,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      widget.movie.title.toUpperCase(),
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      widget.movie.categories,
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 12.0),
                    Text(
                      '⭐⭐⭐⭐',
                      style: TextStyle(fontSize: 25.0),
                    ),
                    SizedBox(height: 15.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text(
                              'Year',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16.0,
                              ),
                            ),
                            SizedBox(height: 2.0),
                            Text(
                              widget.movie.year.toString(),
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              'Episodes',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16.0,
                              ),
                            ),
                            SizedBox(height: 2.0),
                            Text(
                              widget.movie.nbepisodes.toString(),
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 25.0),
                    Container(
                      height: 120.0,
                      child: SingleChildScrollView(
                        child: Text(
                          widget.movie.description,
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ContentScroll(
                images: widget.movie.screenshots.split("@"),
                title: 'Screenshots',
                imageHeight: 200.0,
                imageWidth: 250.0,
              )
            ],
          ),
        ));
  }
}
